//
//  PPMediaCaptureHelper.m
//  AVFoundationDemo
//
//  Created by 王昌阳 on 2019/5/6.
//  Copyright © 2019 王昌阳. All rights reserved.
//

#import "PPMediaCaptureHelper.h"

@implementation PPMediaCaptureHelper

+ (AVAuthorizationStatus)authorizationStatusForVideo {
    return [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
}

+ (AVAuthorizationStatus)authorizationStatusForAudio {
    return [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
}

+ (void)requestAccessAuthorizationForVideoWithBlock:(void(^)(BOOL granted))block {
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (block) {
                block(granted);
            }
        });
    }];
}

+ (void)requestAccessAuthorizationForAudioWithBlock:(void(^)(BOOL granted))block {
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (block) {
                block(granted);
            }
        });
    }];
}

+ (void)requestAccessAuthorizationForPhotoWithBlock:(void(^)(BOOL granted))block {
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (block) {
                block(status == PHAuthorizationStatusAuthorized);
            }
        })
    }];
}

+ (void)requestCaptureAccessWithBlock:(void(^)(PPMediaCaptureAuthorizationStatusModel *authorizationStatus))block {
    __block PPMediaCaptureAuthorizationStatusModel *authorizationStatus = [[PPMediaCaptureAuthorizationStatusModel alloc] init];
    // 请求摄像头权限
    [PPMediaCaptureHelper requestAccessAuthorizationForVideoWithBlock:^(BOOL granted) {
        authorizationStatus.allowVideo = granted;
        [PPMediaCaptureHelper requestAccessAuthorizationForAudioWithBlock:^(BOOL granted) {
            authorizationStatus.allowAudio = granted;
            [PPMediaCaptureHelper requestAccessAuthorizationForPhotoWithBlock:^(BOOL granted) {
                authorizationStatus.allowPhoto = granted;
                // 3、配置 UI 信息
                if (block) {
                    block(authorizationStatus);
                }
            }];
        }];
    }];
}


@end
