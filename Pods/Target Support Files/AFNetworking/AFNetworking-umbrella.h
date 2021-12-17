#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"
#import "AFURLSessionManager.h"
#import "AFCompatibilityMacros.h"
#import "AFNetworkReachabilityManager.h"
#import "AFSecurityPolicy.h"
#import "AFURLRequestSerialization.h"
#import "AFURLResponseSerialization.h"
#import "AFAutoPurgingImageCache.h"
#import "AFImageDownloader.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "UIActivityIndicatorView+AFNetworking.h"
#import "UIButton+AFNetworking.h"
<<<<<<< HEAD
=======
#import "UIImage+AFNetworking.h"
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
#import "UIImageView+AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "UIProgressView+AFNetworking.h"
#import "UIRefreshControl+AFNetworking.h"
<<<<<<< HEAD
#import "WKWebView+AFNetworking.h"
=======
#import "UIWebView+AFNetworking.h"
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28

FOUNDATION_EXPORT double AFNetworkingVersionNumber;
FOUNDATION_EXPORT const unsigned char AFNetworkingVersionString[];

