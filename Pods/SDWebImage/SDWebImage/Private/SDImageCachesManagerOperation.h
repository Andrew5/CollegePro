/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import <Foundation/Foundation.h>
#import "SDWebImageCompat.h"

<<<<<<< HEAD
/// This is used for operation management, but not for operation queue execute
=======
// This is used for operation management, but not for operation queue execute
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
@interface SDImageCachesManagerOperation : NSOperation

@property (nonatomic, assign, readonly) NSUInteger pendingCount;

- (void)beginWithTotalCount:(NSUInteger)totalCount;
- (void)completeOne;
- (void)done;

@end
