//
//  TZPhotoPreviewCell.h
//  TZImagePickerController
//
//  Created by 谭真 on 15/12/24.
//  Copyright © 2015年 谭真. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TZAssetModel;
@interface TZAssetPreviewCell : UICollectionViewCell
@property (nonatomic, strong) TZAssetModel *model;
@property (nonatomic, copy) void (^singleTapGestureBlock)(void);
- (void)configSubviews;
- (void)photoPreviewCollectionViewDidScroll;
@end


@class TZAssetModel,TZProgressView,TZPhotoPreviewView;
@interface TZPhotoPreviewCell : TZAssetPreviewCell

@property (nonatomic, copy) void (^imageProgressUpdateBlock)(double progress);

@property (nonatomic, strong) TZPhotoPreviewView *previewView;

@property (nonatomic, assign) BOOL allowCrop;
@property (nonatomic, assign) CGRect cropRect;
<<<<<<< HEAD
@property (nonatomic, assign) BOOL scaleAspectFillCrop;
=======
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28

- (void)recoverSubviews;

@end


@interface TZPhotoPreviewView : UIView
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *imageContainerView;
@property (nonatomic, strong) TZProgressView *progressView;
<<<<<<< HEAD
@property (nonatomic, strong) UIImageView *iCloudErrorIcon;
@property (nonatomic, strong) UILabel *iCloudErrorLabel;
@property (nonatomic, copy) void (^iCloudSyncFailedHandle)(id asset, BOOL isSyncFailed);


@property (nonatomic, assign) BOOL allowCrop;
@property (nonatomic, assign) CGRect cropRect;
@property (nonatomic, assign) BOOL scaleAspectFillCrop;
=======

@property (nonatomic, assign) BOOL allowCrop;
@property (nonatomic, assign) CGRect cropRect;

>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
@property (nonatomic, strong) TZAssetModel *model;
@property (nonatomic, strong) id asset;
@property (nonatomic, copy) void (^singleTapGestureBlock)(void);
@property (nonatomic, copy) void (^imageProgressUpdateBlock)(double progress);

@property (nonatomic, assign) int32_t imageRequestID;

- (void)recoverSubviews;
@end


@class AVPlayer, AVPlayerLayer;
@interface TZVideoPreviewCell : TZAssetPreviewCell
@property (strong, nonatomic) AVPlayer *player;
@property (strong, nonatomic) AVPlayerLayer *playerLayer;
@property (strong, nonatomic) UIButton *playButton;
@property (strong, nonatomic) UIImage *cover;
@property (nonatomic, strong) NSURL *videoURL;
<<<<<<< HEAD
@property (nonatomic, strong) UIImageView *iCloudErrorIcon;
@property (nonatomic, strong) UILabel *iCloudErrorLabel;
@property (nonatomic, copy) void (^iCloudSyncFailedHandle)(id asset, BOOL isSyncFailed);
=======
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
- (void)pausePlayerAndShowNaviBar;
@end


@interface TZGifPreviewCell : TZAssetPreviewCell
@property (strong, nonatomic) TZPhotoPreviewView *previewView;
@end
