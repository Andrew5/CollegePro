//
//  MJRefreshAutoFooter.h
//  MJRefreshExample
//
//  Created by MJ Lee on 15/4/24.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "MJRefreshFooter.h"

<<<<<<< HEAD
NS_ASSUME_NONNULL_BEGIN

=======
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
@interface MJRefreshAutoFooter : MJRefreshFooter
/** 是否自动刷新(默认为YES) */
@property (assign, nonatomic, getter=isAutomaticallyRefresh) BOOL automaticallyRefresh;

/** 当底部控件出现多少时就自动刷新(默认为1.0，也就是底部控件完全出现时，才会自动刷新) */
@property (assign, nonatomic) CGFloat appearencePercentTriggerAutoRefresh MJRefreshDeprecated("请使用triggerAutomaticallyRefreshPercent属性");

/** 当底部控件出现多少时就自动刷新(默认为1.0，也就是底部控件完全出现时，才会自动刷新) */
@property (assign, nonatomic) CGFloat triggerAutomaticallyRefreshPercent;

<<<<<<< HEAD
/** 自动触发次数, 默认为 1, 仅在拖拽 ScrollView 时才生效,
 
 如果为 -1, 则为无限触发
 */
@property (nonatomic) NSInteger autoTriggerTimes;
@end

NS_ASSUME_NONNULL_END
=======
/** 是否每一次拖拽只发一次请求 */
@property (assign, nonatomic, getter=isOnlyRefreshPerDrag) BOOL onlyRefreshPerDrag;
@end
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
