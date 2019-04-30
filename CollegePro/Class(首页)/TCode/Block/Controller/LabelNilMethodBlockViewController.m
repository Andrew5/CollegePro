//
//  LabelNilMethodBlockViewController.m
//  Test
//
//  Created by Rillakkuma on 2016/11/29.
//  Copyright © 2016年 Rillakkuma. All rights reserved.
//

#import "LabelNilMethodBlockViewController.h"

@interface LabelNilMethodBlockViewController ()

@end

@implementation LabelNilMethodBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];

    // Do any additional setup after loading the view.
	UIButton *pushNillButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[pushNillButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
	[pushNillButton setFrame:CGRectMake(10.0 ,80.0 ,120.0 ,20.0)];
	pushNillButton.backgroundColor = [UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:0.00];       //背景颜
	[pushNillButton setTitle:@"回去" forState:(UIControlStateNormal)];
	[pushNillButton addTarget:self action:@selector(backBlockNilMetnod) forControlEvents:(UIControlEventTouchUpInside)];
	[self.view addSubview:pushNillButton];
	
	
	// Do any additional setup after loading the view.
}
- (void)backBlockNilMetnod{
	
	self.myReturnTextBlock(@"backBlockNilMetnodshu");

	[self dismissViewControllerAnimated:YES completion:nil];

	
	// Do any additional setup after loading the view.
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
