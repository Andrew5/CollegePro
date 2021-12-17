//
//  LBHTTPTool.h
//  LeBangYZ
//
//  Created by Rillakkuma on 2016/10/25.
//  Copyright © 2016年 zhongkehuabo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHTool : NSObject
//**
// *  获取该类的所有属性
// */
//+ (NSDictionary *)getPropertys;
///** 获取所有属性，包含主键pk */
//+ (NSDictionary *)getAllProperties;
//颜色色值
+ (UIColor *) colorWithHexString: (NSString *) stringToConvert;  //@"#5a5a5a"
+ (UIColor *) colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

+ (void)setBorderWithView:(UIView *)view top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width otherBorderWidth:(CGFloat)otherWidth topColor:(UIColor *)topColor leftColor:(UIColor *)leftColor bottomColor:(UIColor *)bottomColor  rightColor:(UIColor *)rightColor;


/*获取网络流量信息*/
+ (long long) getInterfaceBytes;
//获得行高
+ (CGFloat)contentSizeWithText:(NSString *)text;
/*!
 *  判断字符串判断是否为空
 *
 *  @param stirng 传进来的字符
 *
 *  @return YES：为空，NO：不为空
 */

+ (BOOL)IsNSStringNULL:(NSString *)stirng;

/*!
 *  自适应label的宽度
 *
 *  @param text  内容
 *  @param font  字体大小
 *  @param width 高度
 *
 *  @return label的宽度
 */
+ (CGSize)autoSizeOfWidthWithText:(NSString *)text font:(UIFont *)font height:(CGFloat)height;
/*!
 *  自适应label的高度
 *
 *  @param text  内容
 *  @param font  字体大小
 *  @param width 宽度
 *
 *  @return label的高度
 */
+ (CGSize)autoSizeOfHeghtWithText:(NSString *)text font:(UIFont *)font width:(CGFloat)width;

/**
 * 验证手机号码
 */
+ (BOOL)isValidateMobile:(NSString *)mobileNum;
/**验证码
 */
+ (BOOL)validateVerifyCode:(NSString *)verifyCode;
/**密码
 */
+ (BOOL)validatePassword:(NSString *)passWord;
//获得当前时间
+ (NSString *)getCurrectTimeWithPar:(NSString *)par;

+ (NSString *)getIPAddress;
@end
