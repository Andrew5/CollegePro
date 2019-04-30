//
//  LBHTTPTool.m
//  LeBangYZ
//
//  Created by Rillakkuma on 2016/10/25.
//  Copyright © 2016年 zhongkehuabo. All rights reserved.
//

#import "DHTool.h"
//获取设备当前连接网段IP

#include <arpa/inet.h>
#include <netdb.h>
#include <net/if.h>
#include <ifaddrs.h>
#import <dlfcn.h>


@implementation DHTool

#pragma mark - ***** 判断字符串是否为空
+ (BOOL)IsNSStringNULL:(NSString *)stirng
{
	if([stirng isKindOfClass:[NSNull class]]) return YES;
	if(![stirng isKindOfClass:[NSString class]]) return YES;
	
	if(stirng == nil) return YES;
	
	NSString * string1 = [stirng stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	NSUInteger len=[string1 length];
	if (len <= 0) return YES;
	return NO;
}



+ (UIColor *) colorWithHexString: (NSString *) stringToConvert{  //@"#5a5a5a"
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    
    if ([cString length] < 6) return [UIColor blackColor];
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    
    // Separate into r, g, b substrings
    
    NSRange range;
    
    range.location = 0;
    
    range.length = 2;
    
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((CGFloat) r / 255.0f)
            
                           green:((CGFloat) g / 255.0f)
            
                            blue:((CGFloat) b / 255.0f)
            
                           alpha:1.0f];
    
}
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

+ (void)setBorderWithView:(UIView *)view top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width otherBorderWidth:(CGFloat)otherWidth topColor:(UIColor *)topColor leftColor:(UIColor *)leftColor bottomColor:(UIColor *)bottomColor  rightColor:(UIColor *)rightColor
{
	if (top) {
		CALayer *layer = [CALayer layer];
		layer.frame = CGRectMake(0, 0, view.frame.size.width, width);
		layer.backgroundColor = color.CGColor;
		[view.layer addSublayer:layer];
	} else {
		CALayer *layer = [CALayer layer];
		layer.frame = CGRectMake(0, 0, view.frame.size.width, otherWidth);
		layer.backgroundColor = topColor.CGColor;
		[view.layer addSublayer:layer];
	}
	if (left) {
		CALayer *layer = [CALayer layer];
		layer.frame = CGRectMake(0, 0, width, view.frame.size.height);
		layer.backgroundColor = color.CGColor;
		[view.layer addSublayer:layer];
	} else {
		CALayer *layer = [CALayer layer];
		layer.frame = CGRectMake(0, 0, otherWidth, view.frame.size.height);
		layer.backgroundColor = leftColor.CGColor;
		[view.layer addSublayer:layer];
	}
	if (bottom) {
		CALayer *layer = [CALayer layer];
		layer.frame = CGRectMake(0, view.frame.size.height - width, view.frame.size.width, width);
		layer.backgroundColor = color.CGColor;
		[view.layer addSublayer:layer];
	} else {
		CALayer *layer = [CALayer layer];
		layer.frame = CGRectMake(0, view.frame.size.height - otherWidth, view.frame.size.width, otherWidth);
		layer.backgroundColor = bottomColor.CGColor;
		[view.layer addSublayer:layer];
	}
	if (right) {
		CALayer *layer = [CALayer layer];
		layer.frame = CGRectMake(view.frame.size.width - width, 0, width, view.frame.size.height);
		layer.backgroundColor = color.CGColor;
		[view.layer addSublayer:layer];
	} else {
		CALayer *layer = [CALayer layer];
		layer.frame = CGRectMake(view.frame.size.width - width, 0, otherWidth, view.frame.size.height);
		layer.backgroundColor = rightColor.CGColor;
		[view.layer addSublayer:layer];
	}
}


+ (CGSize)autoSizeOfWidthWithText:(NSString *)text font:(UIFont *)font height:(CGFloat)height
{
    CGSize size = CGSizeMake(MAXFLOAT, height);
    //    NSDictionary *attributesDic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    //    CGRect frame = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDic context:nil];
    
    // iOS7以后使用boundingRectWithSize，之前使用sizeWithFont
    // 多行必需使用NSStringDrawingUsesLineFragmentOrigin，网上有人说不是用NSStringDrawingUsesFontLeading计算结果不对
    NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin |
    NSStringDrawingUsesFontLeading;
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByCharWrapping];
    
    NSDictionary *attributes = @{ NSFontAttributeName : font, NSParagraphStyleAttributeName : style };
    
    CGRect rect = [text boundingRectWithSize:size
                                     options:opts
                                  attributes:attributes
                                     context:nil];
    return rect.size;
    
}
+ (CGSize)autoSizeOfHeghtWithText:(NSString *)text font:(UIFont *)font width:(CGFloat)width{
	CGSize size = CGSizeMake(width, MAXFLOAT);
	//    NSDictionary *attributesDic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
	//    CGRect frame = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDic context:nil];
	//
	// iOS7以后使用boundingRectWithSize，之前使用sizeWithFont
	// 多行必需使用NSStringDrawingUsesLineFragmentOrigin，网上有人说不是用NSStringDrawingUsesFontLeading计算结果不对
	NSStringDrawingOptions opts = NSStringDrawingUsesLineFragmentOrigin |
	NSStringDrawingUsesFontLeading;
	
	NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
	[style setLineBreakMode:NSLineBreakByCharWrapping];
	
	NSDictionary *attributes = @{ NSFontAttributeName : font, NSParagraphStyleAttributeName : style };
	
	CGRect rect = [text boundingRectWithSize:size
									 options:opts
								  attributes:attributes
									 context:nil];
	return rect.size;
}
+ (CGFloat)contentSizeWithText:(NSString *)text{
	NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithData:[text dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSPlainTextDocumentType } documentAttributes:nil error:nil];
	NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
	[paragraphStyle setLineSpacing:8];//调整行间距
	NSDictionary * attriBute = @{NSFontAttributeName:DH_FontSize(14)};
	[attrStr addAttributes:attriBute range:NSMakeRange(0, [attrStr length])];
	[attrStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [attrStr length])];
	
	CGSize labelSize=[attrStr boundingRectWithSize:CGSizeMake(DH_DeviceWidth-20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
	return labelSize.height;
	
}
+ (BOOL)isValidateMobile:(NSString *)mobileNum{

	/**
	 * 手机号码
	 * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
	 * 联通：130,131,132,152,155,156,185,186
	 * 电信：133,1349,153,180,189
	 */
	NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
	/**
	 10         * 中国移动：China Mobile
	 11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,184,187,188
	 12         */
	NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[2478])\\d)\\d{7}$";
	/**
	 15         * 中国联通：China Unicom
	 16         * 130,131,132,152,155,156,185,186
	 17         */
	NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
	/**
	 20         * 中国电信：China Telecom
	 21         * 133,1349,153,180,189
	 22         */
	NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
	/**
	 25         * 大陆地区固话及小灵通
	 26         * 区号：010,020,021,022,023,024,025,027,028,029
	 27         * 号码：七位或八位
	 28         */
	// NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
	
	NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
	NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
	NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
	NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
	
	if (([regextestmobile evaluateWithObject:mobileNum] == YES)
		|| ([regextestcm evaluateWithObject:mobileNum] == YES)
		|| ([regextestct evaluateWithObject:mobileNum] == YES)
		|| ([regextestcu evaluateWithObject:mobileNum] == YES))
	{
		return YES;
	}
	else
	{
		return NO;
	}
}

+ (BOOL)validateVerifyCode:(NSString *)verifyCode {
	BOOL flag;
	if (verifyCode.length != 5) {
		flag = NO;
		return flag;
	}
	NSString *regex2 = @"^(\\d{5})";
	NSPredicate *verifyCodePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
	return [verifyCodePredicate evaluateWithObject:verifyCode];
}

//密码
+ (BOOL)validatePassword:(NSString *)passWord {
	NSString *passWordRegex = @"^[a-zA-Z0-9]{6,16}+$";
	NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
	return [passWordPredicate evaluateWithObject:passWord];
}
//MMM:6月 MM:06 MMMMM:6 K:mm-10:21 上午
+ (NSString *)getCurrectTimeWithPar:(NSString *)par{
	NSDate *currentDate = [NSDate date];//获取当前时间，日期
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:par];
	NSString *dateString = [dateFormatter stringFromDate:currentDate];
	NSLog(@"dateString:%@",dateString);
	return dateString;
}
/*获取网络流量信息*/
+ (long long) getInterfaceBytes
{
	struct ifaddrs *ifa_list = 0, *ifa;
	if (getifaddrs(&ifa_list) == -1)
	{
		return 0;
	}
	
	uint32_t iBytes = 0;
	uint32_t oBytes = 0;
	
	for (ifa = ifa_list; ifa; ifa = ifa->ifa_next)
	{
		if (AF_LINK != ifa->ifa_addr->sa_family)
			continue;
		
		if (!(ifa->ifa_flags & IFF_UP) && !(ifa->ifa_flags & IFF_RUNNING))
			continue;
		
		if (ifa->ifa_data == 0)
			continue;
		
		/* Not a loopback device. */
		if (strncmp(ifa->ifa_name, "lo", 2))
		{
			struct if_data *if_data = (struct if_data *)ifa->ifa_data;
			
			iBytes += if_data->ifi_ibytes;
			oBytes += if_data->ifi_obytes;
		}
	}
	freeifaddrs(ifa_list);
	
	NSLog(@"\n[getInterfaceBytes-Total]%d,%d",iBytes,oBytes);
	return iBytes + oBytes;
}

//获取手机的网络的ip地址
+ (NSString *)getIPAddress
{
	BOOL success;
	struct ifaddrs * addrs;
	const struct ifaddrs * cursor;
	success = getifaddrs(&addrs) == 0;
	if (success) {
		cursor = addrs;
		while (cursor != NULL) {
			// the second test keeps from picking up the loopback address
			if (cursor->ifa_addr->sa_family == AF_INET && (cursor->ifa_flags & IFF_LOOPBACK) == 0)
			{
				NSString *name = [NSString stringWithUTF8String:cursor->ifa_name];
				if ([name isEqualToString:@"en0"]) // Wi-Fi adapter
					NSLog(@"IP:%@",[NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)cursor->ifa_addr)->sin_addr)]);
				return [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)cursor->ifa_addr)->sin_addr)];
			}
			cursor = cursor->ifa_next;
		}
		freeifaddrs(addrs);
	}
	return nil;
}

@end
