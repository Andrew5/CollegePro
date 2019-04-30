//
//  THomeCollectionViewCell.m
//  Test
//
//  Created by Rillakkuma on 2017/7/8.
//  Copyright © 2017年 Rillakkuma. All rights reserved.
//

#import "THomeCollectionViewCell.h"

@implementation THomeCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		_labelName = [[UILabel alloc]init];
		_labelName.textAlignment = NSTextAlignmentCenter;
		_labelName.textColor = [UIColor blackColor];
		_labelName.font = DH_FontSize(12);
		
		_imageCover = [[UIImageView alloc]init];
		_imageCover.frame = CGRectMake(self.contentView.centerX/2-3, self.contentView.centerY/2, 40, 40);
		_imageCover.layer.cornerRadius = 15;
//		[_imageCover setContentScaleFactor:[[UIScreen mainScreen] scale]];
//		_imageCover.autoresizingMask = UIViewAutoresizingFlexibleHeight;
//		_imageCover.contentMode = UIViewContentModeScaleAspectFill;
//		_imageCover.clipsToBounds = YES;
		[self.contentView sd_addSubviews:@[_imageCover,_labelName]];

//		float height=CGRectGetMaxY(_labelName.frame);//得到的为仅能名称的坐标的最大值
		_labelName.sd_layout
		.heightIs(14)
		.widthIs(69)
		.centerXEqualToView(self.contentView);
		[_labelName setSingleLineAutoResizeWithMaxWidth:DH_DeviceWidth];

	}
	return self;
}

@end
