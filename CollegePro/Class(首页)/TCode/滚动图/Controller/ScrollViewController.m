//
//  ScrollViewController.m
//  Test
//
//  Created by Rillakkuma on 2017/11/18.
//  Copyright © 2017年 Rillakkuma. All rights reserved.
//

#import "ScrollViewController.h"
#import "iCarousels.h"
#import "ZJBLTimerButton.h"

#define ITEM_SPACING 520

@interface ScrollViewController ()<iCarouselDataSource,iCarouselDelegate>
@property (strong, nonatomic) iCarousels *iCarouselView;

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.view.backgroundColor =[UIColor whiteColor];
	iCarousels *iCarouselView = [[iCarousels alloc] initWithFrame:CGRectMake(10.0 ,64.0 ,self.view.bounds.size.width-20 ,400)];iCarouselView.layer.borderColor = [UIColor redColor].CGColor;iCarouselView.layer.borderWidth = 1.0;
	iCarouselView.backgroundColor = [UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:0.00];       //背景颜色
	[self.view addSubview:iCarouselView];
	self.iCarouselView = iCarouselView;
	self.iCarouselView.delegate = self;
	self.iCarouselView.dataSource = self;
	self.iCarouselView.type = iCarouselTypeCylinder;//设置图片切换的类型
	
    // Do any additional setup after loading the view.
	
	//时间按钮
	ZJBLTimerButton *TimerBtn = [[ZJBLTimerButton alloc] initWithFrame:CGRectMake(100, self.view.bounds.size.height-100, 150, 50)];
	__weak typeof(self) WeakSelf = self;
	TimerBtn.countDownButtonBlock = ^{
		[WeakSelf qurestCode]; //开始获取验证码
	};
	[self.view addSubview:TimerBtn];
	
}
//发生网络请求 --> 获取验证码
- (void)qurestCode {
	
	NSLog(@"发生网络请求 --> 获取验证码");
	
	
}

#pragma mark-

//一共有几个切换的图片
-(NSUInteger)numberOfItemsInCarousel:(iCarousels *)carousel {
	
	return 7;
	
}

-(UIView *)carousel:(iCarousels *)carousel viewForItemAtIndex:(NSUInteger)index {
	
	UIView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%lu.png",(unsigned long)index]]];
	
	view.frame = CGRectMake(100, 50, 100, 100);
	return view;
	
}

-(NSUInteger)numberOfPlaceholdersInCarousel:(iCarousels *)carousel {
	return 0;
}

//一共有几个show切换的图片
-(NSUInteger) numberOfVisibleItemsInCarousel:(iCarousels *)carousel {
	return 7;
}

//图片之间的间隔宽
-(CGFloat)carouselItemWidth:(iCarousels *)carousel {
	
	return ITEM_SPACING;
}


- (CATransform3D)carousel:(iCarousels *)_carousel transformForItemView:(UIView *)view withOffset:(CGFloat)offset
{
	view.alpha = 1.0 - fminf(fmaxf(offset, 0.0), 1.0);
	
	CATransform3D transform = CATransform3DIdentity;
	transform.m34 = self.iCarouselView.perspective;
	transform = CATransform3DRotate(transform, M_PI / 8.0, 0, 1.0, 0);
	return CATransform3DTranslate(transform, 0.0, 0.0, offset * self.iCarouselView.itemWidth);
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





- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
	
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
	
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
	
}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
	return  CGSizeZero;
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

@end
