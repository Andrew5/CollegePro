//
//  WLBallView.m
//  WLBallView
//
//  Created by administrator on 2017/6/15.
//  Copyright © 2017年 WL. All rights reserved.
//

#import "WLBallView.h"
#import "WLBallTool.h"

<<<<<<< HEAD
API_AVAILABLE(ios(9.0))
=======
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
@interface WLBallView ()

@property (nonatomic, assign) UIDynamicItemCollisionBoundsType collisionBoundsType;

@property (nonatomic, strong) WLBallTool * ball;

@end

@implementation WLBallView

@synthesize collisionBoundsType;

- (instancetype)initWithFrame:(CGRect)frame AndImageName:(NSString *)imageName {
    
    if (self = [super initWithFrame:frame]) {
        
        self.image = [UIImage imageNamed:imageName];
        self.layer.cornerRadius = frame.size.width * 0.5;
        self.layer.masksToBounds = YES;
<<<<<<< HEAD
        if (@available(iOS 9.0, *)) {
            self.collisionBoundsType = UIDynamicItemCollisionBoundsTypeEllipse;
        } else {
            // Fallback on earlier versions
        }
=======
        self.collisionBoundsType = UIDynamicItemCollisionBoundsTypeEllipse;
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
    }
    
    return self;
    
}


- (void)starMotion {
    
    WLBallTool * ball = [WLBallTool shareBallTool];
    
    [ball addAimView:self referenceView:self.superview];
}


@end
