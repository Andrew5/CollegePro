//
//  MJRefreshAutoNormalFooter.m
//  MJRefreshExample
//
//  Created by MJ Lee on 15/4/24.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "MJRefreshAutoNormalFooter.h"

@interface MJRefreshAutoNormalFooter()
@property (weak, nonatomic) UIActivityIndicatorView *loadingView;
@end

@implementation MJRefreshAutoNormalFooter
#pragma mark - 懒加载子控件
- (UIActivityIndicatorView *)loadingView
{
    if (!_loadingView) {
<<<<<<< HEAD
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:_activityIndicatorViewStyle];
=======
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:self.activityIndicatorViewStyle];
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
        loadingView.hidesWhenStopped = YES;
        [self addSubview:_loadingView = loadingView];
    }
    return _loadingView;
}

- (void)setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)activityIndicatorViewStyle
{
    _activityIndicatorViewStyle = activityIndicatorViewStyle;
    
<<<<<<< HEAD
    [self.loadingView removeFromSuperview];
=======
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
    self.loadingView = nil;
    [self setNeedsLayout];
}
#pragma mark - 重写父类的方法
- (void)prepare
{
    [super prepare];
    
<<<<<<< HEAD
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000
    if (@available(iOS 13.0, *)) {
        _activityIndicatorViewStyle = UIActivityIndicatorViewStyleMedium;
        return;
    }
#endif
        
    _activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
=======
    self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
}

- (void)placeSubviews
{
    [super placeSubviews];
    
    if (self.loadingView.constraints.count) return;
    
    // 圈圈
    CGFloat loadingCenterX = self.mj_w * 0.5;
    if (!self.isRefreshingTitleHidden) {
<<<<<<< HEAD
        loadingCenterX -= self.stateLabel.mj_textWidth * 0.5 + self.labelLeftInset;
=======
        loadingCenterX -= self.stateLabel.mj_textWith * 0.5 + self.labelLeftInset;
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
    }
    CGFloat loadingCenterY = self.mj_h * 0.5;
    self.loadingView.center = CGPointMake(loadingCenterX, loadingCenterY);
}

- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState
    
    // 根据状态做事情
    if (state == MJRefreshStateNoMoreData || state == MJRefreshStateIdle) {
        [self.loadingView stopAnimating];
    } else if (state == MJRefreshStateRefreshing) {
        [self.loadingView startAnimating];
    }
}

@end
