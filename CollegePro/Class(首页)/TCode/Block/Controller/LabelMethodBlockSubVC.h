//
//  LabelMethodBlockSubVC.h
//  Test
//
//  Created by Rillakkuma on 2016/11/29.
//  Copyright © 2016年 Rillakkuma. All rights reserved.
//

#import <UIKit/UIKit.h>
<<<<<<< HEAD
#import "BaseViewController.h"

typedef void (^ReturnTextBlock)(NSString * _Nonnull showText);

@interface LabelMethodBlockSubVC : BaseViewController
@property (nonatomic, copy) ReturnTextBlock _Nullable returnTextBlock;

- (void)returnText:(ReturnTextBlock _Nonnull )block;

+ (void)getMyBestMethod:(void (^_Nullable)(NSDictionary * _Nonnull))then;
- (void)getMyBestMethod:(void (^_Nonnull)(NSString * _Nonnull))then;
- (void)testNormalBlock;
- (void)showIndex: (NSInteger) index;
=======
typedef void (^ReturnTextBlock)(NSString *showText);

@interface LabelMethodBlockSubVC : UIViewController
@property (nonatomic, copy) ReturnTextBlock returnTextBlock;

- (void)returnText:(ReturnTextBlock)block;
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
@end
