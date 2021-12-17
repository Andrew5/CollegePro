/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "SDWebImageCompat.h"

@class SDAsyncBlockOperation;
typedef void (^SDAsyncBlock)(SDAsyncBlockOperation * __nonnull asyncOperation);

<<<<<<< HEAD
/// A async block operation, success after you call `completer` (not like `NSBlockOperation` which is for sync block, success on return)
=======
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
@interface SDAsyncBlockOperation : NSOperation

- (nonnull instancetype)initWithBlock:(nonnull SDAsyncBlock)block;
+ (nonnull instancetype)blockOperationWithBlock:(nonnull SDAsyncBlock)block;
- (void)complete;

@end
