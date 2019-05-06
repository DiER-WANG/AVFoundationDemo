//
//  PPMeidaCaptureViewController.m
//  AVFoundationDemo
//
//  Created by 王昌阳 on 2019/5/6.
//  Copyright © 2019 王昌阳. All rights reserved.
//

#import "PPMeidaCaptureViewController.h"
#import "PPMediaCaptureHelper.h"
#import "PPMediaCaptureAuthorizationStatusModel.h"
#import "PPMediaCaptureAuthorizedFailureView.h"
#import <Masonry.h>

@interface PPMeidaCaptureViewController ()

@property (nonatomic, strong) PPMediaCaptureAuthorizedFailureView *failureView;

@end

@implementation PPMeidaCaptureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 1、配置 .plist 文件，
    // NSCameraUsageDescription         征求摄像头权限时的弹窗描述文案
    // NSMicrophoneUsageDescription     征求麦克风权限时的弹窗描述文案
    // NSPhotoLibraryUsageDescription   征求相册读写权限的弹窗描述文案
    // 如果不添加的话，会造成 crash
    
    // 2、请求权限
    // 就第一次会有弹窗，
    [PPMediaCaptureHelper requestCaptureAccessWithBlock:^(PPMediaCaptureAuthorizationStatusModel * _Nonnull authorizationStatus) {
        if (authorizationStatus.allowPhoto &&
            authorizationStatus.allowAudio &&
            authorizationStatus.allowVideo) {
            // 展示正确 UI
            // 配置 capture 相关对象
        } else {
            // 展示没有权限 提示 UI
            [self configFailureView:authorizationStatus];
        }
    }];
}

- (void)configFailureView:(PPMediaCaptureAuthorizationStatusModel *)status {
    [self.view addSubview:self.failureView];
    [self.failureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.failureView.status = status;
}

#pragma mark - Getter and Setter
- (PPMediaCaptureAuthorizedFailureView *)failureView {
    if (!_failureView) {
        _failureView = [[PPMediaCaptureAuthorizedFailureView alloc] initWithFrame:CGRectZero];
    }
    return _failureView;
}


@end
