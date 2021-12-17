/*
 *  BMKBusLineSearchOption.h
 *  BMapKit
 *
 *  Copyright 2014 Baidu Inc. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
/// 公交线路检索信息类
@interface BMKBusLineSearchOption : NSObject
/// 城市名
@property (nonatomic, copy) NSString *city;
<<<<<<< HEAD
/// 公交线路的uid 注：从Sug检索或者POI城市检索中搜索公交线路,得到的结果中获取。
=======
/// 公交线路的uid
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
@property (nonatomic, copy) NSString *busLineUid;

@end

