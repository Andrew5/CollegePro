//
//  MJRefreshStateHeader.h
//  MJRefreshExample
//
//  Created by MJ Lee on 15/4/24.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "MJRefreshHeader.h"

<<<<<<< HEAD
NS_ASSUME_NONNULL_BEGIN

@interface MJRefreshStateHeader : MJRefreshHeader
#pragma mark - 刷新时间相关
/** 利用这个block来决定显示的更新时间文字 */
@property (copy, nonatomic, nullable) NSString *(^lastUpdatedTimeText)(NSDate * _Nullable lastUpdatedTime);
=======
@interface MJRefreshStateHeader : MJRefreshHeader
#pragma mark - 刷新时间相关
/** 利用这个block来决定显示的更新时间文字 */
@property (copy, nonatomic) NSString *(^lastUpdatedTimeText)(NSDate *lastUpdatedTime);
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
/** 显示上一次刷新时间的label */
@property (weak, nonatomic, readonly) UILabel *lastUpdatedTimeLabel;

#pragma mark - 状态相关
/** 文字距离圈圈、箭头的距离 */
@property (assign, nonatomic) CGFloat labelLeftInset;
/** 显示刷新状态的label */
@property (weak, nonatomic, readonly) UILabel *stateLabel;
/** 设置state状态下的文字 */
- (void)setTitle:(NSString *)title forState:(MJRefreshState)state;
@end
<<<<<<< HEAD

NS_ASSUME_NONNULL_END
=======
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
