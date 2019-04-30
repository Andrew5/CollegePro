//
//  LabelMethodBlockVC.m
//  Test
//
//  Created by Rillakkuma on 2016/11/29.
//  Copyright © 2016年 Rillakkuma. All rights reserved.
//

#import "LabelMethodBlockVC.h"
#import "LabelMethodBlockSubVC.h"
#import "LabelNilMethodBlockViewController.h"
#import "ALiAlertView.h"
//#import "RadioButton.h"
#import <objc/runtime.h>


@interface LabelMethodBlockVC ()<UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource>{
	NSString *u;
	BOOL snState;
}
@property (nonatomic, strong) ALiAlertView *alert;

@end

@implementation LabelMethodBlockVC

- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationItem.title = @"侧滑";
	self.view.backgroundColor = [UIColor whiteColor];
	
	
	UIButton *buttonName = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[buttonName setFrame:CGRectMake(120, 64, 60, 20)];
//	if (!u) {
		[buttonName setTitle:@"YY" forState:UIControlStateNormal];

//	}[buttonName setTitle:u forState:UIControlStateNormal];
	
	buttonName.backgroundColor = [UIColor clearColor];       //背景颜色
	[buttonName addTarget:self action:@selector(choose) forControlEvents:(UIControlEventTouchUpInside)];
	[self.view addSubview:buttonName];
	
	
	
	UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[pushButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
	[pushButton setFrame:CGRectMake(10.0 ,64.0 ,120.0 ,20.0)];
	[pushButton setTitle:@"带方法的Block" forState:(UIControlStateNormal)];
	pushButton.backgroundColor = [UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:0.00];       //背景颜
	[pushButton addTarget:self action:@selector(pushBlockMetnod) forControlEvents:(UIControlEventTouchUpInside)];
	[self.view addSubview:pushButton];
	
	
	UIButton *pushNillButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[pushNillButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
	[pushNillButton setFrame:CGRectMake(10.0 ,94.0 ,120.0 ,20.0)];
	pushNillButton.backgroundColor = [UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:0.00];       //背景颜
	[pushNillButton setTitle:@"不带方法的Block" forState:(UIControlStateNormal)];
	[pushNillButton addTarget:self action:@selector(pushBlockNilMetnod) forControlEvents:(UIControlEventTouchUpInside)];
	[self.view addSubview:pushNillButton];
	[self tz_popGestureRecognizer];
	
	UIView*yxStateView;
	
	//运行状态
	yxStateView = [[UIView alloc]init];
	yxStateView.layer.borderColor = [UIColor redColor].CGColor;
	yxStateView.layer.borderWidth = 0.3;
	yxStateView.frame = CGRectMake(15 , 120 , DH_DeviceWidth-30, 110);
	[self.view addSubview:yxStateView];
//
//	UILabel *nameLabel = [[UILabel alloc]init];
//	nameLabel.text = @"运行状态";
//	nameLabel.font = [UIFont systemFontOfSize:14];
//	nameLabel.layer.borderColor = [UIColor redColor].CGColor;
//	nameLabel.layer.borderWidth = 0.3;
//	nameLabel.textColor = [UIColor blackColor];
//	nameLabel.frame = CGRectMake(0, 2, 100, 21);
//	[yxStateView addSubview:nameLabel];
	
//	for (int i = 0; i<2; i++) {
//		
//		UIButton *rectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//		rectBtn.frame = CGRectMake(100+100*i, 2, 20, 20);
//		rectBtn.layer.cornerRadius = rectBtn.width/2;
//		rectBtn.backgroundColor = [UIColor redColor];
//		[yxStateView addSubview:rectBtn];
//		
//		
//		UILabel *titlelabel = [[UILabel alloc]init];
//		titlelabel.text = @"正常";
//		titlelabel.font = [UIFont systemFontOfSize:14];
//		titlelabel.textColor = [UIColor blackColor];
//		titlelabel.frame = CGRectMake(150*i, 2, 50, 21);
//		[yxStateView addSubview:titlelabel];
//		
//	}
//i=0
	
//	NSArray *titleTxtArray = @[@"正常",@"故障"];
//	for (int i = 0; i<titleTxtArray.count; i++) {
//		btn = [LBChoose buttonWithType:UIButtonTypeCustom];
//		btn.nameLabel.text = titleTxtArray[i];
//		[btn addTarget:self action:@selector(normalChooseMethod:) forControlEvents:(UIControlEventTouchUpInside)];
//		btn.frame = CGRectMake(30+60*i, 150, 50, 20);
//		[self.view addSubview:btn];
//	}
	
	UILabel *questionText = [[UILabel alloc] initWithFrame:CGRectMake(0,0,280,20)];
	questionText.backgroundColor = [UIColor clearColor];
	questionText.text = @"Which color do you like?";
	[yxStateView addSubview:questionText];
	
//    RadioButton *rb1 = [[RadioButton alloc] initWithGroupId:@"first group" index:0];
//    RadioButton *rb2 = [[RadioButton alloc] initWithGroupId:@"first group" index:1];
//	RadioButton *rb3 = [[RadioButton alloc] initWithGroupId:@"first group" index:2];
	
//    rb1.frame = CGRectMake(10,30,22,22);
//    rb2.frame = CGRectMake(80,30,22,22);
//	rb3.frame = CGRectMake(10,90,22,22);
	
//    [yxStateView addSubview:rb1];
//    [yxStateView addSubview:rb2];
//	[yxStateView addSubview:rb3];
	
	
	UILabel *label1 =[[UILabel alloc] initWithFrame:CGRectMake(40, 30, 60, 20)];
	label1.backgroundColor = [UIColor clearColor];
	label1.text = @"正常";
	[yxStateView addSubview:label1];
	
	UILabel *label2 =[[UILabel alloc] initWithFrame:CGRectMake(100, 30, 60, 20)];
	label2.backgroundColor = [UIColor clearColor];
	label2.text = @"故障";
	[yxStateView addSubview:label2];
	
//	UILabel *label3 =[[UILabel alloc] initWithFrame:CGRectMake(40, 90, 60, 20)];
//	label3.backgroundColor = [UIColor clearColor];
//	label3.text = @"Blue";
//	[yxStateView addSubview:label3];
	
//    [RadioButton addObserverForGroupId:@"first group" observer:self];
	
	

}
//-(void)radioButtonSelectedAtIndex:(NSUInteger)index inGroup:(NSString *)groupId{
//    NSLog(@"changed to %lu in %@",(unsigned long)index,groupId);
//}


- (void)choose{
	self.alert = [[ALiAlertView alloc] init];
	self.alert.tapDismissEnable = YES;
	self.alert.contentView = [self tableView];



	[self.alert show];
}

- (UITableView *)tableView
{
	UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 300, 200) style:UITableViewStylePlain];
	table.backgroundColor = [UIColor orangeColor];
	table.delegate = self;
	table.dataSource = self;
	NSLog(@"-------%f",self.alert.contentView.frame.size.width);
	return table;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *ID =@"UITableViewCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
	}
	cell.textLabel.text = [NSString stringWithFormat:@"这是%ld",indexPath.row];
	return cell;
	
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 40;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	NSLog(@"cell.textLabel.text  %@",cell.textLabel.text);
	u = cell.textLabel.text;
	[self.alert removeFromSuperview];
	
}


- (UIPanGestureRecognizer *)tz_popGestureRecognizer {
	UIPanGestureRecognizer *pan = objc_getAssociatedObject(self, _cmd);
	if (!pan) {
		// 侧滑返回手势 手势触发的时候，让target执行action
		id target = self.navigationController.delegate;
		SEL action = NSSelectorFromString(@"handleNavigationTransition:");
		pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:action];
		pan.maximumNumberOfTouches = 1;
		pan.delegate = self;
		self.navigationController.interactivePopGestureRecognizer.enabled = NO;
		objc_setAssociatedObject(self, _cmd, pan, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	}
	return pan;
}

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
	if ([[self valueForKey:@"_isTransitioning"] boolValue]) {
		return NO;
	}
	if (self.childViewControllers.count <= 1) {
		return NO;
	}
	// 侧滑手势触发位置
	CGPoint location = [gestureRecognizer locationInView:self.view];
	CGPoint offSet = [gestureRecognizer translationInView:gestureRecognizer.view];
	BOOL ret = (0 < offSet.x && location.x <= 40);
	NSLog(@"%@ %@",NSStringFromCGPoint(location),NSStringFromCGPoint(offSet));
	return ret;
}

/// 只有当系统侧滑手势失败了，才去触发ScrollView的滑动
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
	return YES;
}
- (void)tz_addPopGestureToView:(UIView *)view{
	[self tz_addPopGestureToView:self.view];
}
- (void)pushBlockMetnod{
	LabelMethodBlockSubVC *subVC = [[LabelMethodBlockSubVC alloc]init];
	[subVC returnText:^(NSString *showText) {
		NSLog(@"--传值--%@",showText);
		
	}];
	
	[self presentViewController:subVC animated:YES completion:^{
		
	}];
}

- (void)pushBlockNilMetnod{
	LabelNilMethodBlockViewController *subVC = [[LabelNilMethodBlockViewController alloc]init];
	
	subVC.myReturnTextBlock = ^(NSString *showText){
		NSLog(@"showText  %@",showText);
		
	};
	
	[self presentViewController:subVC animated:YES completion:^{
		
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

@end
