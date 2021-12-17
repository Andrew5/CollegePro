//
//  DHMainViewController.m
//  Test
//
//  Created by Rillakkuma on 2017/7/27.
//  Copyright © 2017年 Rillakkuma. All rights reserved.
//

#import "DHMainViewController.h"
#import "MeasurNetTools.h"
#import "QBTools.h"
//功能展示
#import <CoreMotion/CoreMotion.h>
#import "ViewController.h"
#import "THomeCollectionViewCell.h"//主页
#import "T3DTouchViewController.h"//3DTouch
#import "GKHScanQCodeViewController.h"//二维码
#import "ContentOffSetVC.h"//滑动
#import "LSTabBarViewController.h"//四个菜单栏
#import "LBTabBarTextController.h"//中间突起的菜单栏
#import "SignatureViewController.h"//签名
#import "ZLDashboardViewController.h"//动画
#import "ActionViewController.h"//咖啡机动画
#import "TMotionViewController.h"//碰撞球
#import "TShopAnimationViewController.h"//购物车动画
#import "TSidebarViewController.h"//侧边栏
#import "TGuideMViewController.h"//引导页
#import "DHNoteViewController.h"//节点
#import "DHZanViewController.h"//点赞
#import "ScrollImageViewViewController.h"
#import "DHImagePickerViewController.h"//高级定制添加图片
//#import "DocumentViewController.h"//文档
#import "HealthViewController.h"//获取健康步数
#import "PayViewController.h"//支付密码
#import "NetTestViewController.h"//网络测试
//#import "CardViewController.h"
//#import "IDCardViewController.h"
#import "CountdownViewController.h"//倒计时
#import "SubparagraphRootViewController.h"//菜单栏
#import "DropViewController.h"//拖拽
#import "ScrollViewController.h"//滚动
#import "WXPaoPaoViewController.h"//微信气泡聊天
#import "BaseAdressBookViewController.h"//通讯刘
#import "ShowViewController.h"//弹出框
#import "QQListViewController.h"//仿照QQ列表
//#import "BankCardViewController.h"//信用卡识别
//#import "BankCartViewController.h"//银行卡扫描
#import "DisassemblyViewController.h"//手势解锁
#import "ACEViewController.h"//textView自适应高度变化
#import "DHNoteJoyViewController.h"//记事本
#import "WaveProgressViewController.h"//水波动画
#import "iCloudViewController.h"//获取iCloud文件
#import "CustomKeyBoardViewController.h"//键盘
#import "TRViewController.h"//闹铃
#import "SmoothLineViewController.h"//画画板
#import "IndexViewController.h"//苏宁小出、
#import "AdaptionListViewController.h"//自适应列表
#import "SectionsViewController.h"//铃声
#import <AVFoundation/AVFoundation.h>

#include <ifaddrs.h>

#include <arpa/inet.h>

#include <net/if.h>

@interface DHMainViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,QRScanViewDelegate,UIAccelerometerDelegate,AVAudioPlayerDelegate>{
    NSMutableArray *valueArr;
    
    UICollectionView *_collectionView;
    UILabel *_lb_showinfo;
    //测试
    NSTimer *timer;
    UILabel  *displayLabel;//提示语
    
}
@property(nonatomic,strong)AVAudioPlayer * audioPlayer;

@property (nonatomic, strong) CMMotionManager *mgr; // 保证不死
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic ,strong) NSMutableArray *assets;//图片集合

@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *classNames;


@end

@implementation DHMainViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self developer];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUPUI];
    displayLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, DH_DeviceHeight-50, DH_DeviceWidth, 40)];
    displayLabel.backgroundColor = [UIColor colorWithRed:0.962 green:0.971 blue:1.000 alpha:1.000];
    displayLabel.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    displayLabel.layer.shadowOffset = CGSizeMake(0, -5);
    displayLabel.layer.shadowOpacity = 0.5;
    displayLabel.layer.shadowRadius= 4;
    displayLabel.textColor = [UIColor blackColor];
    displayLabel.hidden = YES;
    displayLabel.lineBreakMode = NSLineBreakByWordWrapping;
    displayLabel.numberOfLines = 0;
    [DHTool setBorderWithView:displayLabel top:NO left:NO bottom:NO right:YES borderColor:[UIColor clearColor] borderWidth:0 otherBorderWidth:1 topColor:[UIColor redColor] leftColor:[UIColor orangeColor] bottomColor:[UIColor grayColor] rightColor:[UIColor blueColor]];
    [self.view addSubview:displayLabel];
    [[UIApplication sharedApplication].keyWindow addSubview:displayLabel];
    //    applicationWillEnterForeground
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveHMethod:) name:@"applicationWillEnterForeground" object:nil];
    //    [self playVoiceBackground];
    
}
- (void)playVoiceBackground{
    
    dispatch_queue_t dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(dispatchQueue, ^(void) {
        
        NSError *audioSessionError = nil;
        
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        
        if ([audioSession setCategory:AVAudioSessionCategoryPlayback error:&audioSessionError]){
            
            NSLog(@"Successfully set the audio session.");
            
        } else {
            
            NSLog(@"Could not set the audio session");
            
        }
        
        NSBundle *mainBundle = [NSBundle mainBundle];
        NSString *filePath = [mainBundle pathForResource:@"noVoice" ofType:@"mp3"];
        NSData *fileData = [NSData dataWithContentsOfFile:filePath];
        NSError *error = nil;
        
        self.audioPlayer = [[AVAudioPlayer alloc] initWithData:fileData error:&error];
        
        if (self.audioPlayer != nil){
            
            self.audioPlayer.delegate = self;
            
            [self.audioPlayer setNumberOfLoops:-1];
            
            if ([self.audioPlayer prepareToPlay] && [self.audioPlayer play]){
                
                NSLog(@"Successfully started playing...");
                
            } else {
                
                NSLog(@"Failed to play.");
                
            }
            
        }
        
    });
}

- (void)receiveHMethod:(NSNotification *)notif{
    NSDictionary *dict = notif.userInfo;
    NSString*str_data= [dict valueForKey:@"dict"];
    NSLog(@"str_data %@",str_data);
    [self showHint:[NSString stringWithFormat:@"后台执行时间 %@",str_data] yOffset:10];
}
- (void)proximityStateDidChange
{
    if ([UIDevice currentDevice].proximityState) {
        NSLog(@"有物品靠近");
    } else {
        NSLog(@"有物品离开");
    }
    
}
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    NSLog(@"加速驾驶 /nx:%f y:%f z:%f", acceleration.x, acceleration.y, acceleration.z);
}

- (CMMotionManager *)mgr
{
    if (_mgr == nil) {
        _mgr = [[CMMotionManager alloc] init];
    }
    return _mgr;
}
//- (id)transformedValue:(id)value﻿
//{﻿
//
//    ﻿
//
//       double convertedValue = [value doubleValue];﻿
//
//       int multiplyFactor = 0;﻿
//
//    ﻿
//
//       NSArray *tokens = [NSArray arrayWithObjects:@"bytes",@"KB",@"MB",@"GB",@"TB",@“PB”, @“EB”, @“ZB”, @“YB”,nil];﻿
//
//    ﻿
//
//       while (convertedValue > 1024) {﻿
//
//               convertedValue /= 1024;﻿
//
//               multiplyFactor++;﻿
//
//           }﻿
//
//    ﻿
//
//       return [NSString stringWithFormat:@"%4.2f %@",convertedValue, [tokens objectAtIndex:multiplyFactor]];﻿
//
//}

/*获取网络流量信息*/
+ (long long) getInterfaceBytes
{
    struct ifaddrs *ifa_list = 0, *ifa;
    if (getifaddrs(&ifa_list) == -1)
    {
        return 0;
    }
    
    uint32_t iBytes = 0;
    uint32_t oBytes = 0;
    
    for (ifa = ifa_list; ifa; ifa = ifa->ifa_next)
    {
        if (AF_LINK != ifa->ifa_addr->sa_family)
            continue;
        
        if (!(ifa->ifa_flags & IFF_UP) && !(ifa->ifa_flags & IFF_RUNNING))
            continue;
        
        if (ifa->ifa_data == 0)
            continue;
        
        /* Not a loopback device. */
        if (strncmp(ifa->ifa_name, "lo", 2))
        {
            struct if_data *if_data = (struct if_data *)ifa->ifa_data;
            
            iBytes += if_data->ifi_ibytes;
            oBytes += if_data->ifi_obytes;
        }
    }
    freeifaddrs(ifa_list);
    
    NSLog(@"\n[getInterfaceBytes-Total]%d,%d",iBytes,oBytes);
    return iBytes + oBytes;
}

- (void)developer{
    
    // 1.获取单例对象
    UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
    
    // 2.设置代理
    accelerometer.delegate = self;
    
    // 3.设置采样间隔
    accelerometer.updateInterval = 0.3;
    
    // 1.判断加速计是否可用
    if (!self.mgr.isAccelerometerAvailable) {
        NSLog(@"加速计不可用");
        return;
    }
    
    // 2.设置采样间隔
    self.mgr.accelerometerUpdateInterval = 0.3;
    
    // 3.开始采样
    [self.mgr startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) { // 当采样到加速计信息时就会执行
        if (error) return;
        // 4.获取加速计信息
        //        CMAcceleration acceleration = self.mgr.accelerometerData.acceleration;
        
        CMAcceleration acceleration = accelerometerData.acceleration;
        NSLog(@"4/n获取加速计信息 x:%f y:%f z:%f", acceleration.x, acceleration.y, acceleration.z);
        //        _lb_showinfo.text = [NSString stringWithFormat:@"获取的X:%.2f,获取的Y:%.2f,获取的Z:%.2f",acceleration.x, acceleration.y, acceleration.z];
        
        //        NSLog(@"速度:%@",[NSByteCountFormatter stringFromByteCount:[DHTool getInterfaceBytes] countStyle:NSByteCountFormatterCountStyleFile]);
        //
        //        NSLog(@",获取网速:%.4lld KB",[DHMainViewController getInterfaceBytes]/1024);
        
    }];
    
    if (![CMPedometer isStepCountingAvailable]) {
        NSLog(@"计步器不可用");
        return;
    }
    
    CMPedometer *stepCounter = [[CMPedometer alloc] init];
    
    [stepCounter startPedometerUpdatesFromDate:[NSDate date] withHandler:^(CMPedometerData *pedometerData, NSError *error) {
        if (error) return;
        // 4.获取采样数据
        NSLog(@"获取采样数据 = %@", pedometerData.numberOfSteps);
    }];
    
    
    MeasurNetTools * meaurNet = [[MeasurNetTools alloc] initWithblock:^(float speed) {
        NSString* speedStr = [NSString stringWithFormat:@"%@/S", [QBTools formattedFileSize:speed]];
        NSLog(@"即时速度:speed:%@",speedStr);
        _lb_showinfo.text = [NSString stringWithFormat:@"即时速度:speed:%@",speedStr];
        
    } finishMeasureBlock:^(float speed) {
        NSString* speedStr = [NSString stringWithFormat:@"%@/S", [QBTools formattedFileSize:speed]];
        NSLog(@"平均速度为：%@",speedStr);
        NSLog(@"相当于带宽：%@",[QBTools formatBandWidth:speed]);
        _lb_showinfo.text = [NSString stringWithFormat:@"平均速度为： %@---相当于带宽：%@",speedStr,[QBTools formatBandWidth:speed]];
        
    } failedBlock:^(NSError *error) {
        
    }];
    [meaurNet startMeasur];
    
    //    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [button setFrame:CGRectMake(100.0 ,100.0 ,100.0 ,40.0)];
    //    button.backgroundColor = [UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:0.00];       //背景颜色
    //    [button setTitle:@"点击" forState:0];
    //    [button addTarget:self action:@selector(btnModelInCurrViewTouchupInside:) forControlEvents:(UIControlEventTouchUpInside)];
    //    [self.view addSubview:button];
    //
    //    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [button1 setFrame:CGRectMake(100.0 ,200.0 ,100.0 ,40.0)];
    //    [button1 setTitle:@"点击11" forState:0];
    //    button1.backgroundColor = [UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:0.00];       //背景颜色
    //    [button1 addTarget:self action:@selector(cancelRun:) forControlEvents:(UIControlEventTouchUpInside)];
    //
    //    [self.view addSubview:button1];
    
    
}
- (void)btnModelInCurrViewTouchupInside:(id)sender {
    [self performSelector:@selector(didRuninCurrModel:) withObject:[NSNumber numberWithBool:YES] afterDelay:3.0f];
    
    [self performSelector:@selector(didRuninCurrModelNoArgument) withObject:nil afterDelay:3.0f];
    
    NSLog(@"Test start....");
}

- (void)cancelRun:(id)sender {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(didRuninCurrModel:) object:[NSNumber numberWithBool:YES]];//true
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(didRuninCurrModel:) object:[NSNumber numberWithBool:NO]];//false
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(didRuninCurrModel:) object:nil];//false
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(didRuninCurrModelNoArgument) object:nil];//true
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self];//all ok
    [[self class] cancelPreviousPerformRequestsWithTarget:self];
}

- (void)didRuninCurrModel:(NSNumber *)numFin
{
    NSLog(@"- (void)didRuninCurrModel:%@", numFin.boolValue ? @"YES":@"NO");
}

- (void)didRuninCurrModelNoArgument
{
    NSLog(@"- (void)didRuninCurrModelNoArgument");
}
- (void)setUPUI{
    //    self.navigationController.navigationBar.barTintColor = IWColor(255,155,0);
    //    //设置导航条的背景色
    //    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    // 监听有物品靠近还是离开
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(proximityStateDidChange) name:UIDeviceProximityStateDidChangeNotification object:nil];
    [UIDevice currentDevice].proximityMonitoringEnabled = YES;
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.minimumLineSpacing = 0.0;//minimumLineSpacing cell上下之间的距离
    //    flowLayout.minimumInteritemSpacing = 5.0;//cell左右之间的距离
    //    flowLayout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 20);
    
    _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(15, 0, DH_DeviceWidth-30, DH_DeviceHeight) collectionViewLayout:flowLayout];
    //    _collectionView=[[UICollectionView alloc] init];
    //    _collectionView.collectionViewLayout = flowLayout;
    //注册Cell，必须要有
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"GradientCell"];
    [_collectionView registerClass:[THomeCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([THomeCollectionViewCell class])];
    _collectionView.dataSource=self;
    _collectionView.delegate=self;
    [_collectionView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_collectionView];
    
    self.titles = @[].mutableCopy;
    self.classNames = @[].mutableCopy;
    
    [self addCell:@"上下滑动" class:@"ContentOffSetVC"];
    [self addCell:@"3DTouch" class:@"T3DTouchViewController"];
    [self addCell:@"二维码" class:@"GKHScanQCodeViewController"];
    [self addCell:@"凸起菜单栏" class:@"LBTabBarTextController"];
    [self addCell:@"导航栏" class:@"LSTabBarViewController"];
    [self addCell:@"签名" class:@"SignatureViewController"];
    [self addCell:@"动画" class:@"ZLDashboardViewController"];
    [self addCell:@"咖啡机" class:@"ActionViewController"];
    [self addCell:@"碰撞球" class:@"TMotionViewController"];
    [self addCell:@"侧边栏" class:@"TSidebarViewController"];
    [self addCell:@"购物车" class:@"TShopAnimationViewController"];
//    [self addCell:@"12身份证" class:@"IDCardViewController"];
    [self addCell:@"图片滚动" class:@"ScrollImageViewViewController"];
    [self addCell:@"添加图片" class:@"DHImagePickerViewController"];
    [self addCell:@"文档" class:@"DocumentViewController"];
    [self addCell:@"支付密码框" class:@"PayViewController"];
    [self addCell:@"网络测试" class:@"NetTestViewController"];
    [self addCell:@"倒计时" class:@"CountdownViewController"];
    [self addCell:@"菜单栏" class:@"SubparagraphRootViewController"];
    [self addCell:@"键盘" class:@"CustomKeyBoardViewController"];
    [self addCell:@"拖拽" class:@"DropViewController"];
    [self addCell:@"滚动视图" class:@"ScrollViewController"];
    [self addCell:@"微信气泡聊天" class:@"WXPaoPaoViewController"];
    [self addCell:@"通讯录" class:@"BaseAdressBookViewController"];
    [self addCell:@"弹出框" class:@"ShowViewController"];
    [self addCell:@"QQ联系人" class:@"QQListViewController"];
//    [self addCell:@"27信用卡识别" class:@"BankCardViewController"];
//    [self addCell:@"28银行卡识别" class:@"BankCartViewController"];
//    [self addCell:@"29身份证识别" class:@"XLIDScanViewController"];
    [self addCell:@"手势解锁" class:@"DisassemblyViewController"];
    [self addCell:@"CEll自适应高度" class:@"ACEViewController"];
    [self addCell:@"记事本" class:@"DHNoteJoyViewController"];
    [self addCell:@"水波动画" class:@"WaveProgressViewController"];
    [self addCell:@"画板" class:@"SmoothLineViewController"];
    [self addCell:@"游戏" class:@"IndexViewController"];
    [self addCell:@"自适应列表" class:@"AdaptionListViewController"];
    [self addCell:@"铃声" class:@"SectionsViewController"];
    [self addCell:@"iCloud文件" class:@"iCloudViewController"];
    [self addCell:@"获取健康信息" class:@"HealthViewController"];
    [self addCell:@"闹铃" class:@"TRViewController"];
    [_collectionView reloadData];
    _lb_showinfo = [[UILabel alloc]init];
    _lb_showinfo.backgroundColor = [UIColor brownColor];
    _lb_showinfo.textColor = [UIColor redColor];
    _lb_showinfo.font = DH_FontSize(12);
    _lb_showinfo.layer.borderColor = [UIColor redColor].CGColor;
    _lb_showinfo.layer.borderWidth = 1.0;
    _lb_showinfo.frame = CGRectMake(0, DH_DeviceHeight-44-30, DH_DeviceWidth, 25);
    [self.view addSubview:_lb_showinfo];
    
    
    //    [self scrollerLabel];
    
}
- (void)addCell:(NSString *)title class:(NSString *)className {
    [self.titles addObject:title];
    [self.classNames addObject:className];
}

#pragma mark -- UICollectionViewDataSource
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _titles.count;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"THomeCollectionViewCell";
    THomeCollectionViewCell *_cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    _cell.imageCover.image = [UIImage imageNamed:@"Facebook"];
    //    _cell.layer.shouldRasterize = YES;
    //    _cell.layer.rasterizationScale = [UIScreen mainScreen].scale;
    _cell.labelName.text = [NSString stringWithFormat:@"0%ld_%@",indexPath.row,_titles[indexPath.row]];
    
    _cell.layer.borderColor = [UIColor redColor].CGColor;
    _cell.layer.borderWidth = 1.0;
    
    return _cell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [_collectionView deselectItemAtIndexPath:indexPath animated:NO];
    
    NSString *className = self.classNames[indexPath.row];
    if ([className isEqualToString:@"SubparagraphRootViewController"]) {
        SubparagraphRootViewController *controller = [[SubparagraphRootViewController alloc] init];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
        navController.navigationBarHidden = YES;
        [UIApplication sharedApplication].keyWindow.rootViewController = navController;
        return;
    }
    
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *ctrl = class.new;
        ctrl.title = _titles[indexPath.row];
        push(ctrl);
    }
    
    
}
#pragma mark --UICollectionViewDelegateFlowLayout
//////定义每个Item 的大小(cell的宽高)
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (self.view.frame.size.width/6);//间隙
    
    return CGSizeMake(width,width);
    
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);//(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
}

//minimumLineSpacing 上下item之间的距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 5;
}
//minimumInteritemSpacing 左右item之间的距离
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 5;
}


/**
 *  截取当前屏幕
 *
 *  @return NSData *
 */
- (NSData *)dataWithScreenshotInPNGFormat
{
    CGSize imageSize = CGSizeZero;
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsPortrait(orientation))
        imageSize = [UIScreen mainScreen].bounds.size;
    else
        imageSize = CGSizeMake([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (UIWindow *window in [[UIApplication sharedApplication] windows])
    {
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, window.center.x, window.center.y);
        CGContextConcatCTM(context, window.transform);
        CGContextTranslateCTM(context, -window.bounds.size.width * window.layer.anchorPoint.x, -window.bounds.size.height * window.layer.anchorPoint.y);
        if (orientation == UIInterfaceOrientationLandscapeLeft)
        {
            CGContextRotateCTM(context, M_PI_2);
            CGContextTranslateCTM(context, 0, -imageSize.width);
        }
        else if (orientation == UIInterfaceOrientationLandscapeRight)
        {
            CGContextRotateCTM(context, -M_PI_2);
            CGContextTranslateCTM(context, -imageSize.height, 0);
        } else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
            CGContextRotateCTM(context, M_PI);
            CGContextTranslateCTM(context, -imageSize.width, -imageSize.height);
        }
        if ([window respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
        {
            [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:YES];
        }
        else
        {
            [window.layer renderInContext:context];
        }
        CGContextRestoreGState(context);
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return UIImagePNGRepresentation(image);
}
//测试
- (void)showPromptlanguage:(NSString *)string
{
    [UIView animateWithDuration:1.0 animations:^{
        
        displayLabel.text = string;
        displayLabel.hidden = NO;
        
        //自适应高度
        CGRect txtFrame = displayLabel.frame;
        
        displayLabel.frame = CGRectMake(0, DH_DeviceHeight-50, DH_DeviceWidth,
                                        txtFrame.size.height =[string boundingRectWithSize:
                                                               CGSizeMake(txtFrame.size.width, CGFLOAT_MAX)
                                                                                   options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                                                attributes:[NSDictionary dictionaryWithObjectsAndKeys:displayLabel.font,NSFontAttributeName, nil] context:nil].size.height);
        NSLog(@"执行");
        
    } completion:^(BOOL finished) {
        timer = [NSTimer scheduledTimerWithTimeInterval:10.5f
                                                 target:self
                                               selector:@selector(hiddenDataPicker)
                                               userInfo:nil
                                                repeats:YES];
        [timer fire];
        NSLog(@"完成");
    }];
}

- (void)hiddenDataPicker{
    [UIView animateWithDuration:0.5 animations:^{
        displayLabel.frame = CGRectMake(0, DH_DeviceHeight+50, DH_DeviceWidth, 20);
        NSLog(@"执行隐藏");
    } completion:^(BOOL finished) {
        NSLog(@"执行完毕");
        [timer invalidate];
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)GKHScanQCodeViewController:(GKHScanQCodeViewController *)lhScanQCodeViewController readerScanResult:(NSString *)result {
    
}

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    return CGSizeZero;
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    
}

- (void)setNeedsFocusUpdate {
    
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    return YES;
}

- (void)updateFocusIfNeeded {
    
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end

