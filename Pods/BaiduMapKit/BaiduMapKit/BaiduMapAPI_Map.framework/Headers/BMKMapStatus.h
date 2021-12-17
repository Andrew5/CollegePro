/*
 *  BMKMapStatus.h
 *  BMapKit
 *
 *  Copyright 2011 Baidu Inc. All rights reserved.
 *
 */

#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Base/BMKTypes.h>
//#import <QuartzCore/QuartzCore.h>

///此类表示地图状态信息
@interface BMKMapStatus : NSObject
{
<<<<<<< HEAD
	float       _fLevel;       // 缩放比例，4－21级
=======
	float       _fLevel;       // 缩放比例，3－19级
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
    float       _fRotation;    // 旋转角度
    float       _fOverlooking; // 俯视角度
    
    CGPoint     _targetScreenPt;//屏幕坐标（中心点）
    CLLocationCoordinate2D _targetGeoPt;//地理坐标（中心点）
}
<<<<<<< HEAD
///缩放级别:[4~21]
@property (nonatomic, assign) float fLevel;
///旋转角度
@property (nonatomic, assign) float fRotation;
///俯视角度:[-79~0]
=======
///缩放级别:[3~19]
@property (nonatomic, assign) float fLevel;
///旋转角度
@property (nonatomic, assign) float fRotation;
///俯视角度:[-45~0]
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
@property (nonatomic, assign) float fOverlooking;
///屏幕中心点坐标:在屏幕内，超过无效
@property (nonatomic) CGPoint targetScreenPt;
///地理中心点坐标:经纬度
@property (nonatomic) CLLocationCoordinate2D targetGeoPt;
///当前地图范围，采用直角坐标系表示，向右向下增长
@property (nonatomic, assign, readonly) BMKMapRect visibleMapRect;

@end



