//
//  AppDelegate.m
//  CollegePro
//
//  Created by jabraknight on 2019/4/30.
//  Copyright © 2019 jabrknight. All rights reserved.
//

#import "AppDelegate.h"

#import <UserNotifications/UserNotifications.h>
#import "showView.h"
#import "BaseTabBarViewController.h"
#import "IQKeyboardManager.h"
#import "AppDelegate+DHCategory.h"
#import <AudioToolbox/AudioToolbox.h>
#import "DHGuidepageViewController.h"
#import "DHGuidePageHUD.h"
#import "TRViewController.h"
#import "ScreenBlurry.h"
#define kUseScreenShotGesture 1

@interface AppDelegate ()
{
    BMKMapManager* _mapManager;
    int num;
    
}
@property(nonatomic,strong) UIMutableUserNotificationCategory* categorys;
@property (strong, nonatomic)UIVisualEffectView *visualEffectView;

@end

@implementation AppDelegate

+(void)playSound:(int)soundID{
    SystemSoundID id = soundID;
    AudioServicesPlaySystemSound(id);
    AudioServicesPlaySystemSound(soundID);
    
    //    CFRunLoopRun();
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setMinimumDismissTimeInterval:1.0];
    
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;//控制整个功能是否启用。
    manager.shouldResignOnTouchOutside = YES;//控制点击背景是否收起键盘。
    manager.shouldToolbarUsesTextFieldTintColor = YES;//控制键盘上的工具条文字颜色是否用户自定义。
    manager.enableAutoToolbar = NO;//控制是否显示键盘上的工具条。
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    /*! 版本更新  */
    //    [self VersonUpdate];
    /*! 保存当前时间  */
    [self saveCurrentTime];
    //截屏
    [self screenshot];
    
    _mapManager = [[BMKMapManager alloc]init];
    // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
    BOOL ret = [_mapManager start:@"GqPBelcjdgnnusGN3QjEQ45vjE7YkyE1"  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    
    //    float sysVersion=[[UIDevice currentDevice]systemVersion].floatValue;
    //    if (sysVersion>=8.0) {
    //        if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
    //            UIUserNotificationSettings* newSetting= [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge|UIUserNotificationTypeSound|UIUserNotificationTypeAlert categories:[NSSet setWithObjects:self.categorys, nil]];
    //        }
    //    }
    /*! 写入数据  */
    [self writeFile];
    //如果已经获得发送通知哦的授权则创建本地通知，否则请求授权（注意：如果不请求授权在设置中是没有对应的通知设置项的，也就是说如果从来没有发送过请求，即使通过设置也打不开消息允许设置）
    if ([[UIApplication sharedApplication] currentUserNotificationSettings].types != UIUserNotificationTypeNone) {
        //        [self addLocationForAlert];
    }else{
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound   categories:nil]];
    }
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Alarm:) name:@"Alarm" object:nil];
    //关闭程序后再通过点击通知打开应用获取userInfo
    //接收通知参数
    UILocalNotification *notification=[launchOptions valueForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    NSDictionary *userInfo= notification.userInfo;
    
    NSLog(@"didFinishLaunchingWithOptions:The userInfo is %@.",userInfo);
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[DHGuidepageViewController alloc] init]];
    
    [self.window makeKeyWindow];
    // Override point for customization after application launch.
    return YES;
}
#pragma mark -激活状态
- (void)applicationDidBecomeActive:(UIApplication *)application {
    //去除模糊效果
    [ScreenBlurry removeBlurryScreenImage];
    //    if (self.visualEffectView) {
    //
    //        [self.visualEffectView removeFromSuperview];
    //
    //    }
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
#pragma mark -取消激活状态
- (void)applicationWillResignActive:(UIApplication *)application {
    //添加模糊效果
    //     [[UIApplication sharedApplication].keyWindow addSubview:self.visualEffectView];
    
    [ScreenBlurry addBlurryScreenImage];
    
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}
#pragma mark -进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
    //方法一
    //    [self startcount];
    //方法二
    //    [self keepRunning];
    //方法三
    //    UIApplication*   app = [UIApplication sharedApplication];
    //    __block    UIBackgroundTaskIdentifier bgTask;
    //    bgTask = [app beginBackgroundTaskWithExpirationHandler:^{
    //        dispatch_async(dispatch_get_main_queue(), ^{            if (bgTask != UIBackgroundTaskInvalid)
    //        {
    //            bgTask = UIBackgroundTaskInvalid;
    //        }
    //        });
    //    }];
    //    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    //        dispatch_async(dispatch_get_main_queue(), ^{            if (bgTask != UIBackgroundTaskInvalid)
    //        {
    //            bgTask = UIBackgroundTaskInvalid;
    //        }
    //        });
    //    });
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    //方法四
    [self newMethod];
}
#pragma mark -程序从后台回到前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    [[UIApplication sharedApplication]setApplicationIconBadgeNumber:0];//进入前台取消应用消息图标
    
    //进入前台
    //    [self startEnterForground];
    //方法四
    if (_count >= 5*60) {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"applicationWillEnterForeground" object:nil userInfo:@{@"dict" : [NSNumber numberWithInteger:_count]}];
        _count = 0;
    }
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"applicationWillEnterForeground" object:nil userInfo:@{@"dict" : [NSNumber numberWithInteger:num]}];
    
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}
#pragma mark -程序没有被杀死（处于前台或后台），点击通知后会调用此程序
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"noti:%@",notification);
    // 图标上的数字设置为0
    NSLog(@"noti: %@",notification.userInfo);
    //    application.applicationIconBadgeNumber = 0;
}
#pragma mark -远程通知(个推)注册成功委托
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {    // Required
    //    [JPUSHService registerDeviceToken:deviceToken];
    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"\n>>>[DeviceToken Success]:%@\n\n", token);
    
}
/** 统计APNs通知(个推)的点击数 */
/** APP已经接收到“远程”通知(推送) - 透传推送消息  */
#pragma mark -收到消息调用此方法
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
}
#pragma mark -iOS 10: App在前台获取到通知
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    
}
#pragma mark 调用过用户注册通知方法之后执行（也就是调用完registerUserNotificationSettings:方法之后执行）
-(void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings{
    NSLog(@"33333");
    
}
#pragma mark -程序即将退出
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
#pragma mark  -iOS 10: 点击通知进入App时触发，在该方法内统计有效用户点击数
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
    //    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    //    NSString *payloadMsg = [response.notification.request.content.userInfo objectForKey:@"payload"];
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"didReceiveNotificationResponse" object:nil userInfo:@{@"dict" : payloadMsg}];
    
}
#pragma mark -远程通知注册失败委托
-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    NSLog(@"\n>>>[DeviceToken Error]:%@\n\n", error.description);
}
//在非本App界面时收到本地消息，下拉消息会有快捷回复的按钮，点击按钮后调用的方法，根据identifier来判断点击的哪个按钮，notification为消息内容

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)(void))completionHandler NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED{
    NSLog(@"+++++++++++++++++++++++");
    if ([identifier isEqualToString:KNotificationActionIdentifileStar]) {
        [application cancelAllLocalNotifications];
        
        [_player stop];
        _number_alarm = 5*60;
        [_timer_alarm setFireDate:[NSDate distantPast]];
        
        
        NSLog(@"----------");
    } else if ([identifier isEqualToString:KNotificationActionIdentifileComment]) {
        
        [application cancelAllLocalNotifications];
        
        [_player stop];
        
        NSLog(@"++++++++++");
        
    }
    
    completionHandler();
}
#pragma mark 移除本地通知，在不需要此通知时记得移除
-(void)removeNotification{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}
#pragma mark - 私有方法
#pragma mark 添加本地通知
- (void) addLocalNotification{
    
    //    NSLog(@"22222");
    [UIApplication sharedApplication].delegate = self;
    UILocalNotification * notification=[[UILocalNotification alloc] init];
    
    notification.fireDate=[NSDate dateWithTimeIntervalSinceNow:0];
    
    notification.alertBody=@"闹钟响了。。。。。。";
    
    notification.repeatInterval=NSCalendarUnitDay;
    
    notification.applicationIconBadgeNumber=1;
    notification.hasAction = YES;
    notification.category = KNotificationCategoryIdentifile;
    
    notification.userInfo=@{@"name":@"zhangsan"};
    
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    ////调用通知
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
}
- (void)Alarm:(NSNotification *)noti{
    NSDictionary *dict = noti.object;
    //    NSLog(@"%@",dict[@"Alarm"]) ;
    [self ViewControllerSendTime:(NSUInteger)dict[@"length"]];
}
- (void)newMethod{
    NSLog(@"### -->backgroundinghandler");
    UIApplication *app = [UIApplication sharedApplication];
    _backgroundTaskIdentifier = [app beginBackgroundTaskWithExpirationHandler:^{
        dispatch_async(dispatch_get_main_queue(),^{
            if( _backgroundTaskIdentifier != UIBackgroundTaskInvalid){
                _backgroundTaskIdentifier = UIBackgroundTaskInvalid;
            }
        });
        NSLog(@"====任务完成了。。。。。。。。。。。。。。。===>");
        // [app endBackgroundTask:bgTask];
        
    }];
    
    
    // Start the long-running task
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        while (true) {
            _count++;
            //            dispatch_async(dispatch_get_main_queue(),^{
            //                [UIApplication sharedApplication].applicationIconBadgeNumber = _count;
            //            });
            if (_count >= 5*60) {
                NSLog(@"任务执行完毕，主动调用该方法结束任务");
                break;
                //                [self endBackgroundTask]; // 任务执行完毕，主动调用该方法结束任务
            }
            
            sleep(1);
        }
        
    });
}
#pragma mark -后台计时5分钟
- (void)startcount {
    _number = 0;
    
    self.backgroundTaskIdentifier =[[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^( void) {
        [self endBackgroundTask];
        
    }];
    
    self.timer =[NSTimer scheduledTimerWithTimeInterval:1.0f
                 
                                                 target:self
                 
                                               selector:@selector(timerMethod:)     userInfo:nil
                 
                                                repeats:YES];
    
    [[UIApplication sharedApplication] endBackgroundTask:self.backgroundTaskIdentifier];
    
    self.backgroundTaskIdentifier = UIBackgroundTaskInvalid;
}
#pragma  启动定时器 检测系统派单

- (void) endBackgroundTask{
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    AppDelegate *weakSelf = self;
    
    dispatch_async(mainQueue, ^(void) {
        
        AppDelegate *strongSelf = weakSelf;
        
        if (strongSelf != nil){
            
            [strongSelf.timer invalidate];// 停止定时器
            
            /*
             每个对 beginBackgroundTaskWithExpirationHandler:方法的调用
             必须要相应的调用 endBackgroundTask:方法。这样，来告诉应用程序你已经执行完成了。
             也就是说,我们向 iOS 要更多时间来完成一个任务,那么我们必须告诉 iOS 你什么时候能完成那个任务。
             也就是要告诉应用程序：“好借好还”。
             标记指定的后台任务完成
             */
            
            [[UIApplication sharedApplication] endBackgroundTask:self.backgroundTaskIdentifier];
            
            // 销毁后台任务标识符
            
            strongSelf.backgroundTaskIdentifier = UIBackgroundTaskInvalid;
            
        }
        
    });
    
}
- (void) timerMethod:(NSTimer *)paramSender{
    
    _number  ++;
    
    NSTimeInterval backgroundTimeRemaining =[[UIApplication sharedApplication] backgroundTimeRemaining];
    
    if (backgroundTimeRemaining == DBL_MAX){
        [[UIApplication sharedApplication]setApplicationIconBadgeNumber:_number];
        if (_number>=5*60){
            [self addLocationForAlert:_number];
            [self endBackgroundTask];
            
        }
        //        if (_number % 5 == 0) {
        //            NSLog(@"_numFlag %ld",(long)_number);
        //            if (_number>=100){[self endBackgroundTask];}
        //        }
        
    } else {
        
        NSLog(@"Background Time Remaining = %.02f Seconds", backgroundTimeRemaining);
        
    }
    
}
- (void)startEnterForground{
    [self.timer invalidate];
    
    self.timer = nil;
    
    [[UIApplication sharedApplication] endBackgroundTask:self.backgroundTaskIdentifier];
    
    self.backgroundTaskIdentifier = UIBackgroundTaskInvalid;
    
    if (_number==5*60){
        [[NSNotificationCenter defaultCenter] postNotificationName:@"applicationWillEnterForeground" object:nil userInfo:@{@"dict" : [NSNumber numberWithInteger:_number]}];
    }
}
- (void) addLocationForAlert:(NSInteger)num{
    
    //定义本地通知对象
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    //设置调用时间
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:0];//通知触发时间，10s之后
    notification.repeatInterval = 0; //通知重复次数
    
    //设置通知属性
    notification.alertBody = @"后台执行时间已到";//通知主体
    notification.applicationIconBadgeNumber = num;//应用程序右上角显示的未读消息数
    notification.alertAction = @"滑动打开";//待机界面的滑动动作提示
    notification.alertTitle = @"xxxxApp名称";
    notification.alertLaunchImage = @"Default";//通过点击通知打开应用时的启动图片，这里使用程序启动图片
    notification.soundName= UILocalNotificationDefaultSoundName;//收到通知时播放的声音，默认消息声音
    notification.soundName=@"msg.caf";//通知声音（需要真机才能听到声音）
    //调用通知
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
}

- (void)writeFile{
    ///  路径 如无则自动创建一个
    NSArray *pathArr=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *strPath=[pathArr lastObject];
    
    NSString *strFinalPath=[NSString stringWithFormat:@"%@/myfile.txt",strPath];
    
    // 写入
    NSString *strData=@"123";
    
    NSData *data=[strData dataUsingEncoding:NSUTF8StringEncoding];
    
    NSArray *arrData = [[NSArray alloc]initWithObjects:@"hello",@"asdf", nil];
    //写入数据
    BOOL aResult =[strData writeToFile:strFinalPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    BOOL bResult=[data writeToFile:strFinalPath atomically:YES];
    BOOL cResult=[arrData writeToFile:strFinalPath atomically:YES];
    if (aResult) { NSLog(@"strData 文件写入成功"); }
    if (bResult) { NSLog(@"data 文件写入成功"); }
    if (cResult) { NSLog(@"arrData 文件写入成功"); }
}

- (void)keepRunning {
    [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:nil];
    self.timer_alarm = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"后台运行时间 %d",num);
        _number_alarm++;
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIApplication sharedApplication].applicationIconBadgeNumber = _number_alarm;
        });
    }];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)ViewControllerSendTime:(NSInteger)time{
    self.number_alarm = time;
    NSLog(@"后台计时++++%ld",(long)self.number);
    _timer_alarm = nil;
    if (_timer_alarm == nil) {
        //每隔1秒刷新一次页面
        
        _timer_alarm=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(runAction) userInfo:nil repeats:YES];
        [_timer_alarm setFireDate:[NSDate distantPast]];
        
        [[NSRunLoop currentRunLoop] addTimer:_timer_alarm forMode:NSRunLoopCommonModes];
        
        NSLog(@"开始倒计时.....");
        
    }
    else
    {
        [_timer_alarm setFireDate:[NSDate distantPast]];
    }
}
- (void) runAction{
    _number_alarm--;
    if (_number_alarm == 0) {
        //后台播放音频设置
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setActive:YES error:nil];
        [session setCategory:AVAudioSessionCategoryPlayback error:nil];
        
        //让app支持接受远程控制事件
        [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
        
        //提示框弹出的同时，开始响闹钟
        
        NSString * path=[[NSBundle mainBundle]pathForResource:@"HandClap铃声A_铃声之家cnwav.mp3" ofType:nil];
        
        NSURL * url=[NSURL fileURLWithPath:path];
        
        NSError * error;
        
        _player=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
        
        _player.numberOfLoops=-1;    //无限循环  =0 一遍   =1 两遍    =2 三遍     =负数  单曲循环
        
        _player.volume=2;          //音量
        
        [_player prepareToPlay];    //准备工作
        
        [_timer_alarm setFireDate:[NSDate distantFuture]];
        
        [_player play];
        [self registerLocalNotification];
    }
}

- (void)registerLocalNotification
{
    NSLog(@"4444");
    
    UIMutableUserNotificationAction* action1 = [[UIMutableUserNotificationAction alloc] init];
    
    action1.identifier = KNotificationActionIdentifileStar;
    action1.authenticationRequired = NO;
    action1.destructive = NO;
    action1.activationMode = UIUserNotificationActivationModeBackground;
    action1.title = @"五分钟后响";
    UIMutableUserNotificationAction* action2 = [[UIMutableUserNotificationAction alloc] init];
    
    action2.identifier = KNotificationActionIdentifileComment;
    action2.title = @"关闭闹钟";
    action2.authenticationRequired = NO;
    action2.destructive = NO;
    action2.activationMode = UIUserNotificationActivationModeBackground;
    
    self.categorys = [[UIMutableUserNotificationCategory alloc] init];
    self.categorys.identifier = KNotificationCategoryIdentifile;
    [self.categorys setActions:@[action1,action2] forContext:UIUserNotificationActionContextDefault];
    UIUserNotificationSettings* newSetting= [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge|UIUserNotificationTypeSound|UIUserNotificationTypeAlert categories:[NSSet setWithObject:self.categorys]];
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:newSetting];
    
    if(newSetting.types==UIUserNotificationTypeNone){
        NSLog(@"aaaaaaaaaaa");
        UIUserNotificationSettings* newSetting= [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge|UIUserNotificationTypeSound|UIUserNotificationTypeAlert categories:[NSSet setWithObject:self.categorys]];
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:newSetting];
    }else{
        NSLog(@"bbbbbbbbbbb");
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
        [self addLocalNotification];
    }
}
//获取当前屏幕显示的viewcontroller

- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    
    if (self.window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                self.window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[self.window subviews] lastObject];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]]){
        result = nextResponder;
    }
    //    else{
    //        result = self.window.rootViewController;
    //    }
    return result;
}


//截取当前视图为图片
- (UIImage *)snapshot:(UIView *)view

{
    
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 0);
    
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return image;
    
}
#pragma mark ----------- 当前屏幕截屏 -----------

+ (UIImage *)screenShot {
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    UIGraphicsBeginImageContextWithOptions(screenSize, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (UIWindow *window in [UIApplication sharedApplication].windows) {
        
        if ([window respondsToSelector:@selector(screen)] || [window screen] == [UIScreen mainScreen]) {
            
            CGContextSaveGState(context);
            
            CGContextTranslateCTM(context, window.center.x, window.center.y);
            
            CGContextConcatCTM(context, [window transform]);
            
            CGContextTranslateCTM(context, -[window bounds].size.width * [[window layer] anchorPoint].x, -[window bounds].size.height * [[window layer] anchorPoint].y);
            
            [[window layer] renderInContext:context];
            
            CGContextRestoreGState(context);
        }
        
    }
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

#pragma mark 后台模糊效果

- (UIVisualEffectView *)visualEffectView{
    
    if (!_visualEffectView) {
        
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        
        _visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        
        _visualEffectView.frame = [UIScreen mainScreen].bounds;
        
    }
    
    return _visualEffectView;
    
}

@end
