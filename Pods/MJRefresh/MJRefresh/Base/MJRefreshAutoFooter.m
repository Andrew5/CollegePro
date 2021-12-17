//
//  MJRefreshAutoFooter.m
//  MJRefreshExample
//
//  Created by MJ Lee on 15/4/24.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "MJRefreshAutoFooter.h"

@interface MJRefreshAutoFooter()
/** 一个新的拖拽 */
<<<<<<< HEAD
@property (nonatomic) BOOL triggerByDrag;
@property (nonatomic) NSInteger leftTriggerTimes;
=======
@property (assign, nonatomic, getter=isOneNewPan) BOOL oneNewPan;
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
@end

@implementation MJRefreshAutoFooter

#pragma mark - 初始化
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    
    if (newSuperview) { // 新的父控件
        if (self.hidden == NO) {
            self.scrollView.mj_insetB += self.mj_h;
        }
        
        // 设置位置
        self.mj_y = _scrollView.mj_contentH;
    } else { // 被移除了
        if (self.hidden == NO) {
            self.scrollView.mj_insetB -= self.mj_h;
        }
    }
}

#pragma mark - 过期方法
- (void)setAppearencePercentTriggerAutoRefresh:(CGFloat)appearencePercentTriggerAutoRefresh
{
    self.triggerAutomaticallyRefreshPercent = appearencePercentTriggerAutoRefresh;
}

- (CGFloat)appearencePercentTriggerAutoRefresh
{
    return self.triggerAutomaticallyRefreshPercent;
}

#pragma mark - 实现父类的方法
- (void)prepare
{
    [super prepare];
    
    // 默认底部控件100%出现时才会自动刷新
    self.triggerAutomaticallyRefreshPercent = 1.0;
    
    // 设置为默认状态
    self.automaticallyRefresh = YES;
    
<<<<<<< HEAD
    self.autoTriggerTimes = 1;
=======
    // 默认是当offset达到条件就发送请求（可连续）
    self.onlyRefreshPerDrag = NO;
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
}

- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
    // 设置位置
<<<<<<< HEAD
    self.mj_y = self.scrollView.mj_contentH + self.ignoredScrollViewContentInsetBottom;
=======
    self.mj_y = self.scrollView.mj_contentH;
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
}

- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
    if (self.state != MJRefreshStateIdle || !self.automaticallyRefresh || self.mj_y == 0) return;
    
    if (_scrollView.mj_insetT + _scrollView.mj_contentH > _scrollView.mj_h) { // 内容超过一个屏幕
        // 这里的_scrollView.mj_contentH替换掉self.mj_y更为合理
        if (_scrollView.mj_offsetY >= _scrollView.mj_contentH - _scrollView.mj_h + self.mj_h * self.triggerAutomaticallyRefreshPercent + _scrollView.mj_insetB - self.mj_h) {
            // 防止手松开时连续调用
            CGPoint old = [change[@"old"] CGPointValue];
            CGPoint new = [change[@"new"] CGPointValue];
            if (new.y <= old.y) return;
            
<<<<<<< HEAD
            if (_scrollView.isDragging) {
                self.triggerByDrag = YES;
            }
=======
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
            // 当底部刷新控件完全出现时，才刷新
            [self beginRefreshing];
        }
    }
}

- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
    if (self.state != MJRefreshStateIdle) return;
    
    UIGestureRecognizerState panState = _scrollView.panGestureRecognizer.state;
<<<<<<< HEAD
    
    switch (panState) {
        // 手松开
        case UIGestureRecognizerStateEnded: {
            if (_scrollView.mj_insetT + _scrollView.mj_contentH <= _scrollView.mj_h) {  // 不够一个屏幕
                if (_scrollView.mj_offsetY >= - _scrollView.mj_insetT) { // 向上拽
                    self.triggerByDrag = YES;
                    [self beginRefreshing];
                }
            } else { // 超出一个屏幕
                if (_scrollView.mj_offsetY >= _scrollView.mj_contentH + _scrollView.mj_insetB - _scrollView.mj_h) {
                    self.triggerByDrag = YES;
                    [self beginRefreshing];
                }
            }
        }
            break;
            
        case UIGestureRecognizerStateBegan: {
            [self resetTriggerTimes];
        }
            break;
            
        default:
            break;
    }
}

- (BOOL)unlimitedTrigger {
    return self.leftTriggerTimes == -1;
}

- (void)beginRefreshing
{
    if (self.triggerByDrag && self.leftTriggerTimes <= 0 && !self.unlimitedTrigger) {
        return;
    }
    
    [super beginRefreshing];
=======
    if (panState == UIGestureRecognizerStateEnded) {// 手松开
        if (_scrollView.mj_insetT + _scrollView.mj_contentH <= _scrollView.mj_h) {  // 不够一个屏幕
            if (_scrollView.mj_offsetY >= - _scrollView.mj_insetT) { // 向上拽
                [self beginRefreshing];
            }
        } else { // 超出一个屏幕
            if (_scrollView.mj_offsetY >= _scrollView.mj_contentH + _scrollView.mj_insetB - _scrollView.mj_h) {
                [self beginRefreshing];
            }
        }
    } else if (panState == UIGestureRecognizerStateBegan) {
        self.oneNewPan = YES;
    }
}

- (void)beginRefreshing
{
    if (!self.isOneNewPan && self.isOnlyRefreshPerDrag) return;
    
    [super beginRefreshing];
    
    self.oneNewPan = NO;
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
}

- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState
    
    if (state == MJRefreshStateRefreshing) {
        [self executeRefreshingCallback];
    } else if (state == MJRefreshStateNoMoreData || state == MJRefreshStateIdle) {
<<<<<<< HEAD
        if (self.triggerByDrag) {
            if (!self.unlimitedTrigger) {
                self.leftTriggerTimes -= 1;
            }
            self.triggerByDrag = NO;
        }
        
        if (MJRefreshStateRefreshing == oldState) {
            if (self.scrollView.pagingEnabled) {
                CGPoint offset = self.scrollView.contentOffset;
                offset.y -= self.scrollView.mj_insetB;
                [UIView animateWithDuration:MJRefreshSlowAnimationDuration animations:^{
                    self.scrollView.contentOffset = offset;
                    
                    if (self.endRefreshingAnimationBeginAction) {
                        self.endRefreshingAnimationBeginAction();
                    }
                } completion:^(BOOL finished) {
                    if (self.endRefreshingCompletionBlock) {
                        self.endRefreshingCompletionBlock();
                    }
                }];
                return;
            }
            
=======
        if (MJRefreshStateRefreshing == oldState) {
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
            if (self.endRefreshingCompletionBlock) {
                self.endRefreshingCompletionBlock();
            }
        }
    }
}

<<<<<<< HEAD
- (void)resetTriggerTimes {
    self.leftTriggerTimes = self.autoTriggerTimes;
}

=======
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
- (void)setHidden:(BOOL)hidden
{
    BOOL lastHidden = self.isHidden;
    
    [super setHidden:hidden];
    
    if (!lastHidden && hidden) {
        self.state = MJRefreshStateIdle;
        
        self.scrollView.mj_insetB -= self.mj_h;
    } else if (lastHidden && !hidden) {
        self.scrollView.mj_insetB += self.mj_h;
        
        // 设置位置
        self.mj_y = _scrollView.mj_contentH;
    }
}
<<<<<<< HEAD

- (void)setAutoTriggerTimes:(NSInteger)autoTriggerTimes {
    _autoTriggerTimes = autoTriggerTimes;
    self.leftTriggerTimes = autoTriggerTimes;
}
=======
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
@end
