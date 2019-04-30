//
//  ActionViewController.h
//  动画练习
//
//  Created by uniubi on 2017/3/16.
//  Copyright © 2017年 uniubi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionViewController : UIViewController
// 创建圆角矩形
+ (instancetype)bezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius; // rounds all corners with the same horizontal and vertical radius
@end
