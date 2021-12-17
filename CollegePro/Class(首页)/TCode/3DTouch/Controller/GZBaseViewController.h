//
//  GZBaseViewController.h
//  3DTouch(GZ)
//
//  Created by xinshijie on 2017/4/10.
//  Copyright © 2017年 Mr.quan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GZBaseViewController;

@protocol GZBaseViewControllerDelegate <NSObject>

@required
// 删除按钮点击
- (void)GZViewController:(GZBaseViewController *)GZVC DidSelectedDeleteItem:(NSString *)navTitle;
// 返回按钮点击
- (void)GZViewControllerDidSelectedBackItem:(GZBaseViewController *)GZVC;

@end


<<<<<<< HEAD
@interface GZBaseViewController : BaseViewController
=======
@interface GZBaseViewController : UIViewController
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28


@property (nonatomic,copy)NSString *navTitle;

@property (nonatomic,weak)id<GZBaseViewControllerDelegate> delegate;


@end
