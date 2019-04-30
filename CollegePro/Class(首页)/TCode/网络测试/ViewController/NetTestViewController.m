//
//  NetTestViewController.m
//  Test
//
//  Created by Rillakkuma on 2017/8/11.
//  Copyright © 2017年 Rillakkuma. All rights reserved.
//

#import "NetTestViewController.h"
#import "SFNetWorkManager.h"
#import "CommentsModel.h"
#import "DataModel.h"
@interface NetTestViewController ()
{
	__block NSArray *_dataSource;
	UILabel *labelName;//显示名称
	int count1,count2,count3,count4,count5,coun6,count7,count8;//为创建Timer计时器
	NSTimer *timer1,*timer2,*timer3,*timer4,*timer5,*timer6,*timer7,*timer8;
	
	
	NSString *_someString;
}
@property (nonatomic,assign)dispatch_queue_t queue ;
@property (nonatomic,copy)NSString *someString;
@end

@implementation NetTestViewController
-(void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:animated];
	timer8.fireDate = [NSDate distantFuture];
	timer7.fireDate = [NSDate distantFuture];
	[timer1 invalidate];
	[timer2 invalidate];
	[timer3 invalidate];
	[timer4 invalidate];
	[timer5 invalidate];
	[timer6 invalidate];
	[timer7 invalidate];
	[timer8 invalidate];
	timer1 = nil;
	timer2 = nil;
	timer3 = nil;
	timer4 = nil;
	timer5 = nil;
	timer6 = nil;
	timer7 = nil;
	timer8 = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//	[self getdata];
	[self timer];
	_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
	[self asyncGlobalQueue];//异步
//	[self asyncSerialQueue];//同步
}
-(void)getdata{
	NSString *URL = @"https://app.qipai.com/sevenv2/index.php?controller=life";
	NSString *method = @"requestLifeList";
	NSString *page_id = @"";
	NSString *sort_id = @"1";
	NSString *user_id = @"26";


	NSDictionary *param = NSDictionaryOfVariableBindings(method,page_id,sort_id,user_id);
	[SFNetWorkManager requestWithType:HttpRequestTypeGet withUrlString:URL withParaments:param withSuccessBlock:^(NSDictionary *object) {
		
		_dataSource = [DataModel mj_objectArrayWithKeyValuesArray:object[@"data"]];
			
	} withFailureBlock:^(NSError *error) {
		
	} progress:^(float progress) {
		
	}];
}
-(void)timer{
	count1 = 0;
	
	labelName = [[UILabel alloc]init];
	labelName.textAlignment = NSTextAlignmentCenter;
	labelName.textColor = [UIColor blackColor];
	labelName.font = DH_FontSize(14);
	labelName.frame = CGRectMake(0, 0, 15*10, 30);
	labelName.center = CGPointMake(self.view.centerX, 100);
	[self.view addSubview:labelName];
#pragma mark- NSTimer
	//@property NSTimeInterval tolerance;这是7.0之后新增的一个属性，因为NSTimer并不完全精准，通过这个值设置误差范围。
	/**
	 NSTimer会准时触发事件吗
	 
	 答案是否定的，而且有时候你会发现实际的触发时间跟你想象的差距还比较大。NSTimer不是一个实时系统，因此不管是一次性的还是周期性的timer的实际触发事件的时间可能都会跟我们预想的会有出入。差距的大小跟当前我们程序的执行情况有关系，比如可能程序是多线程的，而你的timer只是添加在某一个线程的runloop的某一种指定的runloopmode中，由于多线程通常都是分时执行的，而且每次执行的mode也可能随着实际情况发生变化。
	 假设你添加了一个timer指定2秒后触发某一个事件，但是签好那个时候当前线程在执行一个连续运算(例如大数据块的处理等)，这个时候timer就会延迟到该连续运算执行完以后才会执行。重复性的timer遇到这种情况，如果延迟超过了一个周期，则会和后面的触发进行合并，即在一个周期内只会触发一次。但是不管该timer的触发时间延迟的有多离谱，他后面的timer的触发时间总是倍数于第一次添加timer的间隙。
	 */
	/**
	 + (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;
	 
	 Interval:设置时间间隔,以秒为单位,一个>0的浮点类型的值，如果该值<0,系统会默认为0.1
	 
	 target:表示发送的对象，如self
	 
	 selector:方法选择器，在时间间隔内，选择调用一个实例方法
	 
	 userInfo:此参数可以为nil，当定时器失效时，由你指定的对象保留和释放该定时器。
	 
	 repeats:当YES时，定时器会不断循环直至失效或被释放，当NO时，定时器会循环发送一次就失效。
	 */
	
//	timer1 = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerRequest) userInfo:nil repeats:YES];
//	[[NSRunLoop currentRunLoop] addTimer:timer1 forMode:NSRunLoopCommonModes];
	/**
	 	使用block的方法就直接在block里面写延时后要执行的代码
	 + (NSTimer *)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block
	 */
//	timer2 = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//		NSLog(@"定时器开始。。。");
//		count2 ++;
//		labelName.text = [NSString stringWithFormat:@"计时器当前计数:%d",count2];
//	}];
//	[[NSRunLoop currentRunLoop] addTimer:timer2 forMode:NSRunLoopCommonModes];
	
	/**
	 	invocation:需要执行的方法
	 + (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti invocation:(NSInvocation *)invocation repeats:(BOOL)yesOrNo;
	 */
//	NSMethodSignature *sgn = [self methodSignatureForSelector:@selector(timerRequest)];
//	NSInvocation *invocation = [NSInvocation invocationWithMethodSignature: sgn];
//	[invocation setTarget: self];
//	[invocation setSelector:@selector(timerRequest)];
//	timer3 = [NSTimer timerWithTimeInterval:1.0 invocation:invocation repeats:YES];
//	[[NSRunLoop currentRunLoop] addTimer:timer3 forMode:NSRunLoopCommonModes];
	
	/**
	 scheduledTimerWithTimeInterval 自动加入到RunLoop自动执行
	 + (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;
	 */
//	timer4 = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerRequest) userInfo:nil repeats:YES];

	/**
	 自动加入到RunLoop自动执行
	 + (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;
	 */
//	timer5 = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//		NSLog(@"定时器开始。。。");
//		count5 ++;
//		labelName.text = [NSString stringWithFormat:@"计时器当前计数:%d",count5];
//	}];
	/**
	 自动加入到RunLoop自动执行
	 + (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti invocation:(NSInvocation *)invocation repeats:(BOOL)yesOrNo;
	 */
//	NSMethodSignature *sgn = [self methodSignatureForSelector:@selector(timerRequest)];
//	NSInvocation *invocation = [NSInvocation invocationWithMethodSignature: sgn];
//	[invocation setTarget: self];
//	[invocation setSelector:@selector(timerRequest)];
//	timer6 = [NSTimer scheduledTimerWithTimeInterval:1.0 invocation:invocation repeats:YES];
	
	/**
	 启动定时器
	 [NSDate distantPast];
	 停止定时器
	 [NSDate distantFuture];
	 - (instancetype)initWithFireDate:(NSDate *)date interval:(NSTimeInterval)ti target:(id)t selector:(SEL)s userInfo:(nullable id)ui repeats:(BOOL)rep;
	 */
//	timer7 = [[NSTimer alloc]initWithFireDate:[NSDate distantPast] interval:1.0 target:self selector:@selector(timerRequest) userInfo:nil repeats:YES];
//	[[NSRunLoop mainRunLoop]addTimer:timer7 forMode:NSDefaultRunLoopMode];
	
	
	/**
	 - (instancetype)initWithFireDate:(NSDate *)date interval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;
	 */
//	timer8 = [[NSTimer alloc]initWithFireDate:[NSDate distantPast] interval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//		NSLog(@"定时器开始。。。");
//		count8 ++;
//		labelName.text = [NSString stringWithFormat:@"计时器当前计数:%d",count8];
//	}];
//	[[NSRunLoop mainRunLoop]addTimer:timer8 forMode:NSDefaultRunLoopMode];
	//测试
//	NSTimer *timeTest = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerRequest) userInfo:nil repeats:YES];
//	[self performSelector:@selector(simulateBusy:) withObject:@"ojbcet" afterDelay:3];

#pragma mark- 线程
	/*
	atomic 与 nonatomic
	
	问题：什么是原子性？ 说明并比较atomic和nonatomic。 atomic是百分之百安全的吗？
	
	原子性：并发编程中确保其操作具备整体性，系统其它部分无法观察到中间步骤，只能看到操作前后的结果。
	atomic：原子性的，编译器会通过锁定机制确保setter和getter的完整性。
	nonatomic：非原子性的，不保证setter和getter的完整性。
	区别：由于要保证操作完整，atomic速度比较慢，线程相对安全；nonatomic速度比较快，但是线程不安全。atomic也不是绝对的线程安全，当多个线程同时调用set和get时，就会导致获取的值不一样。由于锁定机制开销较大，一般iOS开发中会使用nonatomic，而macOS中使用atomic通常不会有性能瓶颈。
	拓展：要想线程绝对安全，就要使用 @synchronized同步锁。但是由于同步锁有等待操作，会降低代码效率。为了兼顾线程安全和提升效率，可采用GCD并发队列进行优化改进。get使用同步派发，set使用异步栅栏。
	*/
	/*
	 内存管理语义
	 
	 1.关键词
	 strong：表示指向并拥有该对象。其修饰的对象引用计数会 +1 ，该对象只要引用计数不为 0 就不会销毁，强行置空可以销毁它。一般用于修饰对象类型、字符串和集合类的可变版本。
	 copy：与strong类似，设置方法会拷贝一份副本。一般用于修饰字符串和集合类的不可变版， block用copy修饰。
	 weak：表示指向但不拥有该对象。其修饰的对象引用计数不会增加，属性所指的对象遭到摧毁时属性值会清空。ARC环境下一般用于修饰可能会引起循环引用的对象，delegate用weak修饰，xib控件也用weak修饰。
	 assign：主要用于修饰基本数据类型，如NSIteger、CGFloat等，这些数值主要存在于栈中。
	 unsafe_unretained：与weak类似，但是销毁时不自动清空，容易形成野指针。
	 
	 2.比较 copy 与 strong
	 
	 copy与strong：相同之处是用于修饰表示拥有关系的对象。不同之处是strong复制是多个指针指向同一个地址，而copy的复制是每次会在内存中复制一份对象，指针指向不同的地址。NSString、NSArray、NSDictionary等不可变对象用copy修饰，因为有可能传入一个可变的版本，此时能保证属性值不会受外界影响。
	 注意：若用strong修饰NSArray，当数组接收一个可变数组，可变数组若发生变化，被修饰的属性数组也会发生变化，也就是说属性值容易被篡改；若用copy修饰NSMutableArray，当试图修改属性数组里的值时，程序会崩溃，因为数组被复制成了一个不可变的版本。
	 
	 3.比较 assign、weak、unsafe_unretain
	 
	 相同点：都不是强引用。
	 不同点：weak引用的 OC 对象被销毁时, 指针会被自动清空，不再指向销毁的对象，不会产生野指针错误；unsafe_unretain引用的 OC 对象被销毁时, 指针并不会被自动清空, 依然指向销毁的对象，很容易产生野指针错误:EXC_BAD_ACCESS；assign修饰基本数据类型，内存在栈上由系统自动回收。
	 
	 Property的默认设置
	 
	 基本数据类型：atomic, readwrite, assign
	 对象类型：atomic, readwrite, strong
	 注意：考虑到代码可读性以及日常代码修改频率，规范的编码风格中关键词的顺序是：原子性、读写权限、内存管理语义、getter/getter。
	 
	 延伸
	 
	 我们已经知道 @property 会使编译器自动编写访问这些属性所需的方法，此过程在编译期完成，称为 自动合成 (autosynthesis)。与此相关的还有两个关键词：@dynamic 和 @synthesize。
	 
	 @dynamic：告诉编译器不要自动创建实现属性所用的实例变量，也不要为其创建存取方法。即使编译器发现没有定义存取方法也不会报错，运行期会导致崩溃。
	 @synthesize：在类的实现文件里可以通过 @synthesize 指定实例变量的名称。
	 注意：在Xcode4.4之前，@property 配合 @synthesize使用，@property 负责声明属性，@synthesize 负责让编译器生成 带下划线的实例变量并且自动生成setter、getter方法。Xcode4.4 之后 @property 得到增强，直接一并替代了 @synthesize 的工作。
	 */
#pragma mark- 队列
	/*
	 
	 全局队列与并发队列的区别：
	 
	 1. 全局队列没有名称，并发队列有名称。
	 2. 全局队列能供所有的应用程序共享。
	 3. 在MRC开发中，全局队列不需要释放，但是并发队列需要释放。
	 二者调度任务的方式相同。
	 注意：并发队列有名称，可以方便系统运行出错时根据队列名称在日志中进行查找。
	 GCD默认已经提供了全局的并发队列，供整个应用使用，不需要手动创建。使用dispatch_get_global_queue函数获取全局的并发队列。
	 
		dispatch_queue_t dispatch_get_global_queue(dispatch_queue_priority_t  priority, unsigned long flags);
		 priority: 队列的优先级设为0即可  flags：此参数暂时无用，用0即可。举例如下：
		dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);  // 获得全局并发队列
		全局并发队列的优先级：
		#define DISPATCH_QUEUE_PRIORITY_HIGH 2 // 高
		#define DISPATCH_QUEUE_PRIORITY_DEFAULT 0 // 默认（中）
		#define DISPATCH_QUEUE_PRIORITY_LOW (-2) // 低
		#define DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN // 后台
		使用dispatch_queue_create函数创建串行队dispatch_queue_t
		dispatch_queue_create(const char *label, // 队列名称
		dispatch_queue_attr_t attr // 队列属性，如果是串行就传NULL
		);具体使用如下：
		dispatch_queue_t queue =dispatch_queue_create(“aaa”,NULL); // 创建串行队列
		dispatch_release(queue); // 非ARC需要释放手动创建的队列。
		主队列是GCD自带的一种特殊的串行队列。
		放到主队列中的任务，都会放到主线程中执行。
		使用dispatch_get_main_queue()获得主队列
		dispatch_queue_t queue = dispatch_get_main_queue();
	 
					   全局并行队列  	手动创建串行队列
		 同步(sync)  | 没有开启新线程 | 没有开启新线程  | 会死锁
			并行		   串行执行任务	 串行执行任务
		 异步(async) | 有开启新线程   | 有开启新线程	  | 没有开启新线程
			并行       并行执行任务	   | 串行执行任务	  | 串行执行任务
	 https://www.jianshu.com/p/44d84e275962
	 */
	/*
	 变量声明出来存放在栈上面
	 而block，默认存放在NSGlobalBlock 全局的block；我们常常把block和C中的函数做对比，此时也类似，NSGlobalBlock类似于函数，存放在代码段
	 
	 当block内部使用了外部的变量时，block的存放位置变成了NSMallockBlock（堆）
	 
	 __block 修饰以后，会类似于桥接，将被修饰的变量被block所持有，此时该变量也转存到堆空间，所以此时Block内部就可以对外部的变量进行修改
	 
	 （还有NSStatckBlock位于栈内存）
	 */
}
//同步锁
- (NSString *)someString {
	@synchronized(self) {
		return _someString;
	}
}
- (void)setSomeString:(NSString *)someString {
	@synchronized(self) {
		_someString = someString;
	}
}
////并发队列
//- (NSString *)someString {
//	__block NSString *localSomeString;
//	dispatch_sync(_queue, ^{
//		localSomeString = _someString;
//	});
//	return localSomeString;
//}
//- (void)setSomeString:(NSString *)someString {
//	dispatch_barrier_async(_queue, ^{
//		_someString = someString;
//	});
//}

/*
 在主队列不允许开新的线程且在主线程中负责调度任务，不会再子线程中调度，再异步执行中会开启新线程，且会在新线程中执行，但不会马上就执行，异步主队列只会把新任务放在主队列，但不会马上执行，等线程有空了才执行
 */
/**
 *  async -- 并发队列（最常用）
 *  会不会创建线程：会，一般同时开多条
 *  任务的执行方式：并发执行
 */
- (void)asyncGlobalQueue
{
	// 获得全局的并发队列
	dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
	
	// 将 任务 添加 全局队列 中去 异步 执行
	dispatch_async(queue, ^{
		NSLog(@"-----下载图片1---%@", [NSThread currentThread]);
	});
	dispatch_async(queue, ^{
		NSLog(@"-----下载图片2---%@", [NSThread currentThread]);
	});
	dispatch_async(queue, ^{
		NSLog(@"-----下载图片3---%@", [NSThread currentThread]);
	});
	dispatch_async(queue, ^{
		NSLog(@"-----下载图片4---%@", [NSThread currentThread]);
	});
	dispatch_async(queue, ^{
		NSLog(@"-----下载图片5---%@", [NSThread currentThread]);
	});
}
/**
 *  async -- 串行队列（有时候用）
 *  会不会创建线程：会，一般只开1条线程
 *  任务的执行方式：串行执行（一个任务执行完毕后再执行下一个任务）
 */
- (void)asyncSerialQueue
{
	// 1.创建一个串行队列
	dispatch_queue_t queue = dispatch_queue_create("cn.heima.queue", NULL);
	
	// 2.将任务添加到串行队列中 异步 执行
	dispatch_async(queue, ^{
		NSLog(@"-----下载图片10---%@", [NSThread currentThread]);
	});
	dispatch_async(queue, ^{
		NSLog(@"-----下载图片20---%@", [NSThread currentThread]);
	});
	dispatch_async(queue, ^{
		NSLog(@"-----下载图片30---%@", [NSThread currentThread]);
	});
	dispatch_async(queue, ^{
		NSLog(@"-----下载图片40---%@", [NSThread currentThread]);
	});
	dispatch_async(queue, ^{
		NSLog(@"-----下载图片50---%@", [NSThread currentThread]);
	});
}


// 核心概念：
// 任务：Block  即将任务保存到一个Block中去。
// 队列： 把任务放到队列里面，队列先进先出的原则，把任务一个个取出（放到对应的线程）执行。
// 串行队列：顺序执行。即一个一个的执行。
// 并行队列：同时执行。同时执行很多个任务。
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self gcdTest3];
}

#pragma mark GCD 演练
/*
 串行队列：顺序，一个一个执行。
 同步：在当前线程执行，不会开辟新线程。
 dispatch：调度，GCD里面的函数都是以dispatch开头的。
 */
-(void)gcdTest1
{
	// 1. 创建一个串行队列
	// 参数：1.队列标签(纯c语言)   2.队列的属性
	dispatch_queue_t  queue =  dispatch_queue_create("itcast", DISPATCH_QUEUE_SERIAL);
	
	// 2. 同步执行任务
	// 一般只要使用“同步” 执行，串行队列对添加的任务，会立马执行。
	dispatch_sync(queue, ^{
		NSLog(@"%@", [NSThread currentThread]);
	});
	NSLog(@"完成！");
}

/**
 串行队列：任务必须要一个一个先后执行。
 异步执行：肯定会开新线程，在新线程执行。
 结果：只会开辟一个线程，而且所有任务都在这个新的线程里面执行。
 */
-(void)gcdTest2
{
	// 1. 串行队列
	dispatch_queue_t queue = dispatch_queue_create("itcast", DISPATCH_QUEUE_SERIAL);
	// 按住command进入， #define DISPATCH_QUEUE_SERIAL NULL
	//  DISPATCH_QUEUE_SERIAL 等于直接写NULL， 且开发的时候都使用NULL
	// 2. 异步执行
	for (int i=0 ; i<10 ; i++) {
		dispatch_async(queue, ^{
			NSLog(@"%@  %d", [NSThread currentThread], i);
		});
	}
}

/**
 并发队列：可以同时执行多个任务，
 异步执行：肯定会开新线程，在新线程执行。
 结果：会开很多个线程，同时执行。
 */
-(void)gcdTest3
{
	// 1. 并发队列
	dispatch_queue_t queue = dispatch_queue_create("cz", DISPATCH_QUEUE_CONCURRENT);
	
	// 异步执行任务
	for (int i=0 ; i<10 ; i++) {
		dispatch_async(queue, ^{
			NSLog(@"%@  %d", [NSThread currentThread], i);
		});
	}
}

/**
 并发队列：可以同时执行多个任务
 同步执行：不会开辟新线程，是在当前线程执行。
 结果：不开新线程，顺序执行。
 */
-(void)gcdTest4
{
	// 并发队列
	dispatch_queue_t queue = dispatch_queue_create("itcast", DISPATCH_QUEUE_CONCURRENT);
	for (int i=0 ; i< 10; i++) {
		dispatch_sync(queue, ^{
			NSLog(@"%@  %d", [NSThread currentThread], i);
		});
	}
	
}


/**
 解析如下：
 串行队列：即要求按顺序挨个执行队列内的任务，即一次只执行一个。
 并行队列：即要求同时执行队列内的任务。即一次要执行一个或多个队列内的任务。
 同步执行：即只在当前线程执行队列内的任务，不会另外开辟新的线程。
 异步执行：即开辟一个或多个新的线程来执行队列内的任务，让新的线程来执行。
 
 串行队列同步执行：即由当前线程按顺序执行队列内的任务，不会开辟新的线程。
 串行队列异步执行：即另外开辟一个新的线程（仅仅一个），并由这个新的线程来顺序执行队列内的任务，因为异步就是另外开辟线程，又因为串行队列一次只要求执行一个，所以只开辟一个新的线程来顺序执行即可。
 并行队列同步执行：即由当前线程同时执行队列内的任务。由于当前单线程是无法实现同时执行多个任务即无法一次执行多个任务，所以只会由当前线程顺序执行队列内的任务。
 并行队列异步执行：另外开辟多个线程来同时执行队列内的任务。因为队列内的任务要求同时执行多个，又可以开辟新的线程。所以会开辟多个新的线程来同时执行队列内的任务。但执行任务的顺序不确定，且开辟新线程的个数不确定。
 需要注意的是：同步只在当前线程执行。异步只在别的线程执行。
 */

/*****************************************************************************************/
#pragma mark - 主队列
/**
 主队列：专门负责在主线程上调度任务，不会在子线程调度任务，在主队列不允许开新线程。
 主队列特点：不允许开新线程。
 异步执行：会开新线程，在新线程执行。
 异步特点：异步任务不需要马上执行，只是把任务放到主队列，等线程有空再去执行，也就是等gcdTest5执行完毕，主线程就有空了。
 结果：不开线程，只能在主线程上，顺序执行。
 */
-(void) gcdTest5
{
	// 1. 获得主队列—> 程序启动以后至少有一个主线程—> 一开始就会创建主队列。
	dispatch_queue_t queue = dispatch_get_main_queue();
	
	NSLog(@"开始------------------------");
	// 2. 异步执行任务
	for(int i=0; i<10; i++){
		NSLog(@"调度前");
		// 异步：把任务放到主队列里，但是不需要马上执行。
		dispatch_async(queue, ^{  // 也就是说，把{}内的任务先放到队列里面，等主线程别的任务完成之后才执行。
			NSLog(@"%@  %d", [NSThread currentThread], i);
		});
		NSLog(@"睡会");
		[NSThread sleepForTimeInterval:1.0];
	}
	NSLog(@"完成------------------------");
	/**
	 之所以将放到主队列内的任务最后执行，是因为当前队列所在的gcdTest5方法正由主线程进行执行，只有将先调度的gcdTest5执行完毕，才会执行加在队列内的任务。注意在执行方法过程中只是先把任务加到队列中。
	 */
}

/**
 主队列：专门负责在主线程上调度任务，不会在子线程调度任务，在主队列不允许开新线程。
 同步执行：要马上执行。
 结果：死锁。
 */
-(void)gcdTest6
{
	
	// 1. 获得主队列—> 程序启动以后至少有一个主线程—> 一开始就会创建主队列。
	dispatch_queue_t queue = dispatch_get_main_queue();
	
	NSLog(@"开始------------------------");
	// 2. 同步执行任务
	for(int i=0; i<10; i++){
		NSLog(@"调度前");
		// 同步：把任务放到主队列里，但是需要马上执行。
		dispatch_sync(queue, ^{
			NSLog(@"%@  %d", [NSThread currentThread], i);
		});
		NSLog(@"睡会");
		[NSThread sleepForTimeInterval:1.0];
	}
	NSLog(@"完成------------------------");
	/**
	 同步任务需要马上执行，但是主线程上面正在执行gcdTest6。所以需要等gcdTest6执行完毕，但是gcdTest6也在等主队列内的任务执行完毕。相互等待造成主线程阻塞。产生死锁。
	 */
}

/******************************************************************************************/

#pragma mark GCD- 同步任务的所用
-(void)gcdTest7
{
	// 并发队列
	dispatch_queue_t queue = dispatch_queue_create("cz", DISPATCH_QUEUE_CONCURRENT);
	/**
	 例子：有一个小说下载网站
	 - 必须登录，才能下载小说
	 
	 有三个任务：
	 1. 下载任务
	 2. 下载小说A
	 3. 下载小说B
	 */
	// 添加任务
	// 同步任务：需要马上执行，不会开辟新线程。
	dispatch_sync(queue, ^{
		NSLog(@"用户登录 %@", [NSThread currentThread]);
	});
	dispatch_async(queue, ^{
		NSLog(@"下载小说A%@", [NSThread currentThread]);
	});
	dispatch_async(queue, ^{
		NSLog(@"下载小说B %@", [NSThread currentThread]);
	});
}

/***************************************************************************************/
#pragma mark- GCD全局队列
-(void)gcdTest8
{
	// 获得全局队列
	/**  一般不修改优先级
	 第一个参数，一般写0 （可以适配IOS7或IOS8）
	 第二个参数，保留参数，0
	 IOS7
	 DISPATCH_QUEUE_PRIORITY_HIGH 2   高优先级
	 DISPATCH_QUEUE_PRIORITY_DEFAULT 0  默认优先级
	 DISPATCH_QUEUE_PRIORITY_LOW (-2)   低优先级
	 DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN 后台优先级（最低）
	 
	 IOS8   左边与IOS7对照
	 DISPATCH_QUEUE_PRIORITY_HIGH:         QOS_CLASS_USER_INITIATED
	 DISPATCH_QUEUE_PRIORITY_DEFAULT:      QOS_CLASS_DEFAULT
	 DISPATCH_QUEUE_PRIORITY_LOW:          QOS_CLASS_UTILITY
	 DISPATCH_QUEUE_PRIORITY_BACKGROUND:   QOS_CLASS_BACKGROUND
	 
	 为了对IOS7或8都使用，所以写0即可
	 */
	dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
	// 异步执行任务
	for (int i=0 ; i<10 ; i++) {
		dispatch_async(queue, ^{
			NSLog(@"%@  %d", [NSThread currentThread], i);
		});
	}
}

/**
 全局队列与并发队列的区别：
 1. 全局队列没有名称，并发队列有名称。
 2. 全局队列，是供所有的应用程序共享。
 3. 在MRC开发中，全局队列不需要释放，但并发队列需要释放。
 对比：调度任务的方式相同。
 */

// 模拟当前线程正好繁忙的情况
- (void)simulateBusy:(NSString *)str{
	NSLog(@"str %@",str);

	NSLog(@"定时器开始创建");
	NSTimer *timer1 = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerRequest) userInfo:nil repeats:YES];
	//没有把定时器添加到RunLoop中
	/**
	 我们前面自己动手添加runloop的时候，可以看到有一个参数runloopMode，这个参数是干嘛的呢？
	 前面提到了要想timer生效，我们就得把它添加到指定runloop的指定mode中去，通常是主线程的defalut mode。但有时我们这样做了，却仍然发现timer还是没有触发事件。这是为什么呢？
	 这是因为timer添加的时候，我们需要指定一个mode，因为同一线程的runloop在运行的时候，任意时刻只能处于一种mode。所以只能当程序处于这种mode的时候，timer才能得到触发事件的机会。
	 举个不恰当的例子，我们说兄弟几个分别代表runloop的mode，timer代表他们自己的才水桶，然后一群人去排队打水，只有一个水龙头，那么同一时刻，肯定只能有一个人处于接水的状态。也就是说你虽然给了老二一个桶，但是还没轮到它，那么你就得等，只有轮到他的时候你的水桶才能碰上用场。
	 */
	
//	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//		//创建定时器
	//	[[NSRunLoop currentRunLoop] addTimer:timer3 forMode:NSRunLoopCommonModes];

//		[[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];
//
//	});
//	dispatch_async(dispatch_get_main_queue(), ^{
//		//创建定时器
//		[[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];
//	});
	timer1 = timer1;
	NSLog(@"定时器创建完成");
	
	
//	NSLog(@"start simulate busy!");
//	NSUInteger caculateCount = 0x0FFFFFFF;
//	CGFloat uselessValue = 0;
//	for (NSUInteger i = 0; i < caculateCount; ++i) {
//		uselessValue = i / 0.3333;
//	}
//	NSLog(@"finish simulate busy!");
}
- (void)timerRequest{
	count1 ++;
	labelName.text = [NSString stringWithFormat:@"计时器当前计数:%d",count1];
	NSLog(@"定时器开始。。。");
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

@end
