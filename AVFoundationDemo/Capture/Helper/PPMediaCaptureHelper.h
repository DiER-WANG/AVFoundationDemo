//
//  PPMediaCaptureHelper.h
//  AVFoundationDemo
//
//  Created by 王昌阳 on 2019/5/6.
//  Copyright © 2019 王昌阳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>
#import "PPMediaCaptureAuthorizationStatusModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPMediaCaptureHelper : NSObject

/// 检查摄像头权限
+ (AVAuthorizationStatus)authorizationStatusForVideo;
/// 检查麦克风权限
+ (AVAuthorizationStatus)authorizationStatusForAudio;
/// 请求摄像头权限
+ (void)requestAccessAuthorizationForVideoWithBlock:(void(^)(BOOL granted))block;
/// 请求麦克风权限
+ (void)requestAccessAuthorizationForAudioWithBlock:(void(^)(BOOL granted))block;
/// 请求相册读写权限
+ (void)requestAccessAuthorizationForPhotoWithBlock:(void(^)(BOOL granted))block;
/// 请求相应权限
+ (void)requestCaptureAccessWithBlock:(void(^)(PPMediaCaptureAuthorizationStatusModel *authorizationStatus))block;

@end

NS_ASSUME_NONNULL_END
