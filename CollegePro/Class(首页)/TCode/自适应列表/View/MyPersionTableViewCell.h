//
//  MyPersionTableViewCell.h
//  XLCircleProgressDemo
//
//  Created by TY on 2018/7/20.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomerTitleModel.h"
typedef void (^CustomEvent)(NSString* str);

@interface MyPersionTableViewCell : UITableViewCell

@property (nonatomic,strong) CustomerTitleModel *model;
@property (strong,nonatomic) CustomEvent cst;
+ (void)getMyBestMethod:(void (^)(NSDictionary *dict))then;

- (void)getMyBestMethod:(void (^)(NSString *))then;
- (void)testNormalBlock;
- (void)showIndex: (NSInteger) index;
- (void)showCstEvent;

@end
