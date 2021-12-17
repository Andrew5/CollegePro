//
//  LabelMethodBlockVC.h
//  Test
//
//  Created by Rillakkuma on 2016/11/29.
//  Copyright © 2016年 Rillakkuma. All rights reserved.
//

#import <UIKit/UIKit.h>
<<<<<<< HEAD

@interface LabelMethodBlockVC : BaseViewController
=======
typedef void (^ReturnTextBlock)(NSString *showText);

@interface LabelMethodBlockVC : UIViewController
@property (nonatomic, copy) ReturnTextBlock returnTextBlock;
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28

@end
