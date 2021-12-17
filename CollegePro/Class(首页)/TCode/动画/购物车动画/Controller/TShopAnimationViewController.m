//
//  TShopAnimationViewController.m
//  Test
//
//  Created by Rillakkuma on 2017/7/16.
//  Copyright © 2017年 Rillakkuma. All rights reserved.
//

#import "TShopAnimationViewController.h"

@interface TShopAnimationViewController ()<CAAnimationDelegate>
{
	UIImageView *mainImageView;
	int angle;
}
@end

@implementation TShopAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationItem.title = @"购物车";
	
	self.view.backgroundColor = [UIColor whiteColor];

	[self setUPUI];
    // Do any additional setup after loading the view.
}
- (void)setUPUI{
	//http://blog.csdn.net/iosevanhuang/article/details/14488239
	mainImageView = [[UIImageView alloc]init];
//	mainImageView.animationImages =[NSArray arrayWithObjects:[UIImage imageNamed:@"超级球"],[UIImage imageNamed:@"大师球"],[UIImage imageNamed:@"高级球"],nil];
	
	[mainImageView setImage:[UIImage imageNamed:@"超级球"]];
//	[mainImageView setAnimationDuration:1.5];
//	[mainImageView setAnimationRepeatCount:5];
	mainImageView.frame = CGRectMake(50, 100, 40, 40);
	[self.view addSubview: mainImageView];
	//
	CABasicAnimation* rotationAnimation;
	rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
	rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
	rotationAnimation.duration = 3;
	rotationAnimation.cumulative = YES;
	rotationAnimation.repeatCount = MAXFLOAT;
	
	[mainImageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
	[self startAnimation];

//	CALayer *layer = [mainImageView layer];
//	layer.anchorPoint = CGPointMake(0.5, 0.0);
//	layer.position = CGPointMake(layer.position.x + layer.bounds.size.width * (layer.anchorPoint.x - 0.5), layer.position.y + layer.bounds.size.height * (layer.anchorPoint.y - 0.5));
//
//
//	CAKeyframeAnimation * keyAnimaion = [CAKeyframeAnimation animation];
//	keyAnimaion.keyPath = @"transform.rotation";
//	keyAnimaion.values = @[@(-30 / 180.0 * M_PI),@(10 / 180.0 * M_PI),@(-30/ 180.0 * M_PI),@(0 / 180.0 * M_PI)];//度数转弧度
//	keyAnimaion.removedOnCompletion = NO;
//	keyAnimaion.fillMode = kCAFillModeForwards;
//	keyAnimaion.duration = 0.5;
//	keyAnimaion.repeatCount = 3;
//	[mainImageView.layer addAnimation:keyAnimaion forKey:nil];
	
	
	
//	//创建CAKeyframeAnimation
//		CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
//		animation.duration = 0.5;
//		animation.repeatCount = MAXFLOAT;
//		animation.removedOnCompletion = NO;
//		animation.fillMode = kCAFillModeForwards;
//		animation.delegate = self;
//	
////	存放图片的数组
//		NSMutableArray *array = [NSMutableArray array];
//		for(NSUInteger i = 1;i < 3 ;i++) {
//			if (i % 3 == 0){
//				UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"0%lu",(unsigned long)i]];
//				CGImageRef cgimg = img.CGImage;
//				[array addObject:(__bridge UIImage *)cgimg];
//			}
//		}
//		animation.values = array;
//		[mainImageView.layer addAnimation:animation forKey:nil];
	
	
//	UILabel *labelName1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 10, 10)];
//	labelName1.backgroundColor = [UIColor redColor];       //背景颜色
//	[self.view addSubview:labelName1];
//	

//	UILabel *labelName2 = [[UILabel alloc] initWithFrame:CGRectMake(300, 200, 10, 10)];
//	labelName2.backgroundColor = [UIColor redColor];       //背景颜色
//	[self.view addSubview:labelName2];
//
//	
//	UILabel *labelName3 = [[UILabel alloc] initWithFrame:CGRectMake(250, self.view.frame.size.height-80, 10, 10)];
//	labelName3.backgroundColor = [UIColor redColor];       //背景颜色
//	[self.view addSubview:labelName3];
//	
//	UILabel *labelName4 = [[UILabel alloc] initWithFrame:CGRectMake(50, 300, 10, 10)];
//	labelName4.backgroundColor = [UIColor redColor];       //背景颜色
//	[self.view addSubview:labelName4];
	
	
	
//	CALayer *layer = [mainImageView layer];
//	layer.position = CGPointMake(100,100); //a 点
//	mainImageView.layer.position = CGPointMake(100,100);
//	// 路径
//	UIBezierPath *path = [UIBezierPath bezierPath];
//	[path moveToPoint:CGPointMake(100,100)];
//	[path addQuadCurveToPoint:CGPointMake(250,self.view.frame.size.height-80) controlPoint:CGPointMake(300, 200)];
	
//	// 指定position属性（移动）
//	CABasicAnimation *animation =
//	[CABasicAnimation animationWithKeyPath:@"position"];
//	animation.duration = 2.5; // 动画持续时间
//	animation.repeatCount = 1; // 不重复
//	animation.beginTime = CACurrentMediaTime() + 2; // 2秒后执行
//	animation.autoreverses = YES; // 结束后执行逆动画
//	// 动画先加速后减速
//	animation.timingFunction =
//	[CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseInEaseOut];
//	// 设定动画起始帧和结束帧
//	animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(50, 100)]; // 起始点
//	animation.toValue = [NSValue valueWithCGPoint:CGPointMake(320, 480)]; // 终了点
//	[mainImageView.layer addAnimation:animation forKey:@"group"];

//
//
//	//关键帧动画
//	CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//	pathAnimation.path = path.CGPath;
//
//
//	CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
//	rotateAnimation.removedOnCompletion = YES;
//	rotateAnimation.fromValue = [NSNumber numberWithFloat:0];
//	rotateAnimation.toValue = [NSNumber numberWithFloat:12];
//	rotateAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//	CAAnimationGroup *groups = [CAAnimationGroup animation];
//	groups.animations = @[pathAnimation,rotateAnimation];
//	groups.duration = 4;
//	groups.removedOnCompletion=NO;
//	groups.fillMode=kCAFillModeForwards;
//	[mainImageView.layer addAnimation:groups forKey:@"group"];
	
	/*
	// 关键帧
	CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//	CGMutablePathRef path = CGPathCreateMutable();
//	CGPathAddArcToPoint(path, nil, 60, 60, 100, 100, 50);
//	CGPathAddArcToPoint(path, nil, 100, 160, 200, 200, 50);
//
// animation.path = path;
	//动画时间
	//动画均匀进行kCAAnimationPaced
	animation.calculationMode = kCAAnimationCubicPaced;
	//设置value
	
	NSValue *value1=[NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width/2-100, self.view.frame.size.height/2+5)];
	
	NSValue *value2=[NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width/2-80, self.view.frame.size.height/2+10)];
	
	NSValue *value3=[NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width/2-60, self.view.frame.size.height/2+20)];
	
	NSValue *value4=[NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width/2-40, self.view.frame.size.height/2+40)];
	
	NSValue *value5=[NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width/2-20, self.view.frame.size.height/2+60)];
	
	NSValue *value6=[NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width/2-10, self.view.frame.size.height/2+80)];
	
	NSValue *value7=[NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2+100)];
	
	NSValue *value8=[NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width/2+10, self.view.frame.size.height/2+110)];
	
	NSValue *value9=[NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width/2+20, self.view.frame.size.height/2+120)];

	NSValue *value10=[NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width/2+30, self.view.frame.size.height/2+130)];

	NSValue *value11=[NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width/2+40, self.view.frame.size.height/2+140)];

	NSValue *value12=[NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width/2+50, self.view.frame.size.height/2+150)];

	NSValue *value13=[NSValue valueWithCGPoint:CGPointMake(self.view.frame.size.width/2+60, self.view.frame.size.height/2+80)];

	animation.values=@[value1,value2,value3,value4,value5,value6,value7,value8,value9,value10,value11,value12,value13];
	
	//重复次数 默认为1
	
	animation.repeatCount=MAXFLOAT;
	
	//设置是否原路返回默认为不
	
	animation.autoreverses = YES;
	
	//设置移动速度，越小越快
	
	animation.duration = 4.0f;
	
	animation.removedOnCompletion = YES;
	
	animation.fillMode = kCAFillModeForwards;
	
	animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	
	animation.delegate=self;
	
	//给这个view加上动画效果
	
	[mainImageView.layer addAnimation:animation forKey:nil];
	
	*/
	
//	CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//	
//	//创建一个CGPathRef对象，就是动画的路线
//	
//	CGMutablePathRef path = CGPathCreateMutable();
//	
//	//自动沿着弧度移动
//	
//	CGPathAddEllipseInRect(path, NULL, CGRectMake(150, 200, 200, 100));
//	
//	//设置开始位置
//	
//	CGPathMoveToPoint(path,NULL,100,100);
//	
//	//沿着直线移动
//	
//	CGPathAddLineToPoint(path,NULL, 200, 100);
//	
//	CGPathAddLineToPoint(path,NULL, 200, 200);
//	
//	CGPathAddLineToPoint(path,NULL, 100, 200);
//	
//	CGPathAddLineToPoint(path,NULL, 100, 300);
//	
//	CGPathAddLineToPoint(path,NULL, 200, 400);
//	
//	//沿着曲线移动
//	
//	CGPathAddCurveToPoint(path,NULL,50.0,275.0,150.0,275.0,70.0,120.0);
//	
//	CGPathAddCurveToPoint(path,NULL,150.0,275.0,250.0,275.0,90.0,120.0);
//	
//	CGPathAddCurveToPoint(path,NULL,250.0,275.0,350.0,275.0,110.0,120.0);
//	
//	CGPathAddCurveToPoint(path,NULL,350.0,275.0,450.0,275.0,130.0,120.0);
//	
//	animation.path=path;
//	
//	CGPathRelease(path);
//	
//	animation.autoreverses = YES;
//	
//	animation.repeatCount=MAXFLOAT;
//	
//	animation.removedOnCompletion = NO;
//	
//	animation.fillMode = kCAFillModeForwards;
//	
//	animation.duration = 4.0f;
//	
//	animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//	
//	animation.delegate=self;
//	
//	[mainImageView.layer addAnimation:animation forKey:nil];
	
	
}
-(void)startAnimation

{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.01];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(endAnimation)];
	mainImageView.transform = CGAffineTransformMakeRotation(angle * (M_PI / 180.0f));
	[UIView commitAnimations];
}

-(void)endAnimation

{
	angle += 10;
	[self startAnimation];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    int contentOffsety = scrollView.contentOffset.y;
    NSLog(@"-移动数据-%d",contentOffsety);

//    CGFloat offsetY = scrollView.contentOffset.y;

}

//- (void)startAnimation
//
//{
//
//	CGAffineTransform endAngle = CGAffineTransformMakeRotation(mainImageView * (M_PI / 180.0f));
//
//	[UIView animateWithDuration:0.01 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
//
//		mainImageView.transform = endAngle;
//
//	} completion:^(BOOL finished) {
//
//		angle += 10; [self startAnimation];
//
//	}];
//
//}
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
