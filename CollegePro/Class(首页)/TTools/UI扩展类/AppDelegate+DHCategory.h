//
//  AppDelegate+DHCategory.h
//  Test
//
//  Created by Rillakkuma on 2017/7/28.
//  Copyright © 2017年 Rillakkuma. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (DHCategory)
/*! 版本  */
- (void)VersonUpdate;
////*! 保存当前时间  */
- (void)saveCurrentTime;
- (BOOL)isUpdate;
//截屏
- (void)screenshot;
@end
