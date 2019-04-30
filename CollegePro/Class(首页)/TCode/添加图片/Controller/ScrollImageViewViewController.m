//
//  ScrollImageViewViewController.m
//  Test
//
//  Created by Rillakkuma on 2017/6/29.
//  Copyright © 2017年 Rillakkuma. All rights reserved.
//
#define ScreenSize      [UIScreen mainScreen].bounds.size
#define ScrollWidth     ScreenSize.width
#define ScrollHeight    450
#import "CollectionImageView.h"

#import "ScrollImageViewViewController.h"
#import "ScrollImageView.h"

@interface ScrollImageViewViewController ()<UIScrollViewDelegate,ScrollImageViewDelegate>

@property (nonatomic, strong)ScrollImageView *scrollImageView;


@end

@implementation ScrollImageViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"轮播图（无限循环）";
	self.automaticallyAdjustsScrollViewInsets = NO;
	
	[self.view addSubview:self.scrollImageView];

	
	NSArray *images = @[@"icc1",@"icc2",@"icc3",@"icc4",@"icc5"];
	CollectionImageView *view = [[CollectionImageView alloc]initWithFrame:CGRectMake(0, 200, ScreenSize.width, 100) imageArray:images selectImageBlock:^(NSInteger index) {
		NSLog(@"点击的是第%ld个",(long)index);
	}];
	[self.view addSubview:view];

	
	
    // Do any additional setup after loading the view.
}

- (ScrollImageView *)scrollImageView
{
	if (!_scrollImageView) {
		// 定义好宽高即可，这里用的屏幕宽高
		NSArray * dataUrls = @[@"http://",@"http://",@"http://",@"http://"];
		NSArray * dataPics = @[@"icc1",@"icc2",@"icc3",@"icc4",@"icc5"];
		_scrollImageView = [[ScrollImageView alloc] initWithFrame:CGRectMake(0, 64, ScrollWidth, ScrollHeight)andPictureUrls:dataUrls andPlaceHolderImages:dataPics];
		_scrollImageView.delegate = self;
	}
	return _scrollImageView;
}
#pragma mark -----scrollImageViewDelegate
-(void)scrollImageView:(ScrollImageView *)srollImageView didTapImageView:(UIImageView *)image atIndex:(NSInteger)index
{
	NSLog(@"点击的是第%zd个图片，该图片是:%@",index,image);
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
