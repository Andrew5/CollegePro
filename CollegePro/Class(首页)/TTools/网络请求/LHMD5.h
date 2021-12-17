#import <Foundation/Foundation.h>

@interface LHMD5 : NSObject

/**
 *  md5加密
 *
 *  @param inPutText 需要加密的字符串
 *
 *  @return 加密好的字符串
 */
+ (NSString *)md5:(NSString *)inPutText;

@end
