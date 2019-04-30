//
//  BaseViewController.m
//  Test
//
//  Created by Rillakkuma on 2017/7/27.
//  Copyright © 2017年 Rillakkuma. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
- (void)setBackItem {
	[self setBackItemAction:nil];
}
- (void)setBackItemAction:(SEL)sel {
	[self setBackItem:@"返回" action:sel];
}
-(void)dh_setupUI{
	
}
-(void)dh_setupNavi{
	
}
-(void)dh_netUse4Gnet{
	
}
-(void)dh_setBackItem
{
	
}
-(void)dh_setNavbarBackgroundHidden:(BOOL)hidden{
	
}
- (void)setBackItem:(NSString *)title action:(SEL)sel {
	UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:self action:sel];
	self.navigationItem.backBarButtonItem = backItem;
}

- (void)dh_hideBottomBarPush:(BaseViewController *)controller {
	self.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController:controller animated:YES];
	self.hidesBottomBarWhenPushed = NO;
	
}


-(UIBarButtonItem *)dh_tbarBackButtonWhiteAndPopView
{
	UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	leftBtn.frame = CGRectMake(0, 0, 20, 22);
	[leftBtn setImage:[UIImage imageNamed:@"title_back"] forState:UIControlStateNormal];
	[leftBtn setImageEdgeInsets:UIEdgeInsetsMake(4,17,5,19)];
	[leftBtn addTarget:self action:@selector(popBack) forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
	return leftBarBtnItem;
}
-(UIBarButtonItem *)dh_tBarIconButtonItem:(NSString *)text action:(SEL)selctor
{
	UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	backBtn.frame = CGRectMake(0, 0, 40, 25);
	[backBtn setTitle:text forState:UIControlStateNormal];
	backBtn.titleLabel.font = [UIFont systemFontOfSize:13];
	[backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[backBtn addTarget:self action:selctor forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
	return backItem;
}
-(UIBarButtonItem *)dh_tBarIconButtonItemWithImage:(NSString *)text action:(SEL)selctor{
	UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	backBtn.frame = CGRectMake(0, 0, 30, 35);
	[backBtn setImage:[UIImage imageNamed:text] forState:UIControlStateNormal];
	//	[backBtn setImageEdgeInsets:UIEdgeInsetsMake(4,17,5,19)];
	[backBtn addTarget:self action:selctor forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
	return backItem;
}

-(void)popBack{
	
	[self.navigationController popViewControllerAnimated:YES];
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
