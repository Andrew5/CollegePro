//
//  MJRefreshAutoStateFooter.h
//  MJRefreshExample
//
//  Created by MJ Lee on 15/6/13.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "MJRefreshAutoFooter.h"

<<<<<<< HEAD
NS_ASSUME_NONNULL_BEGIN

=======
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
@interface MJRefreshAutoStateFooter : MJRefreshAutoFooter
/** 文字距离圈圈、箭头的距离 */
@property (assign, nonatomic) CGFloat labelLeftInset;
/** 显示刷新状态的label */
@property (weak, nonatomic, readonly) UILabel *stateLabel;

/** 设置state状态下的文字 */
- (void)setTitle:(NSString *)title forState:(MJRefreshState)state;

/** 隐藏刷新状态的文字 */
@property (assign, nonatomic, getter=isRefreshingTitleHidden) BOOL refreshingTitleHidden;
@end
<<<<<<< HEAD

NS_ASSUME_NONNULL_END
=======
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
