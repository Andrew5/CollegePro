//
//  BMKSearchVersion.h
//  SearchComponent
//
//  Created by wzy on 15/9/9.
//  Copyright © 2015年 baidu. All rights reserved.
//

#ifndef BMKSearchVersion_h
#define BMKSearchVersion_h

#import <UIKit/UIKit.h>

/**
 *重要：
 *base组件的版本和search组件的版本必须一致，否则不能正常使用
 */

/**
 *获取当前地图API search组件 的版本号
 *return  返回当前API search组件 的版本号
 */
<<<<<<< HEAD
UIKIT_EXTERN NSString* BMKGetMapApiSearchComponentVersion(void);
=======
UIKIT_EXTERN NSString* BMKGetMapApiSearchComponentVersion();
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28

/**
 *检查search组件的版本号是否和base组件的版本号一致
 *return    版本号一致返回YES
 */
<<<<<<< HEAD
UIKIT_EXTERN BOOL BMKCheckSearchComponentIsLegal(void);
=======
UIKIT_EXTERN BOOL BMKCheckSearchComponentIsLegal();
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28

#endif /* BMKSearchVersion_h */
