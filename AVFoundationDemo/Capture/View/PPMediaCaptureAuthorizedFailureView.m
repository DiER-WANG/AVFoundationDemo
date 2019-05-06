//
//  PPMediaCaptureAuthorizedFailureView.m
//  AVFoundationDemo
//
//  Created by 王昌阳 on 2019/5/6.
//  Copyright © 2019 王昌阳. All rights reserved.
//

#import "PPMediaCaptureAuthorizedFailureView.h"
#import <Masonry.h>
#import "PPMediaCaptureAuthorizationStatusModel.h"

@interface PPMediaCaptureAuthorizedFailureView ()

@property (nonatomic, strong) UILabel *videoAccessLabel;
@property (nonatomic, strong) UILabel *audioAccessLabel;
@property (nonatomic, strong) UILabel *photoAccessLabel;

@end

@implementation PPMediaCaptureAuthorizedFailureView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    [self addSubview:self.videoAccessLabel];
    [self addSubview:self.audioAccessLabel];
    [self addSubview:self.photoAccessLabel];
}

- (void)initSubLayouts {
    [self.videoAccessLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    [self.audioAccessLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.videoAccessLabel.mas_top);
    }];
    [self.photoAccessLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.videoAccessLabel.mas_bottom);
    }];
}

- (void)setStatus:(PPMediaCaptureAuthorizationStatusModel *)status {
    _status = status;
    self.videoAccessLabel.text = _status.allowVideo ? @"有摄像头访问权限" : @"无摄像头访问权限";
    self.audioAccessLabel.text = _status.allowAudio ? @"有麦克风访问权限" : @"无麦克风访问权限";
    self.photoAccessLabel.text = _status.allowPhoto ? @"有相册访问权限" : @"无相册访问权限";
}

#pragma mark - Getter and Setter
- (UILabel *)videoAccessLabel {
    if (!_videoAccessLabel) {
        _videoAccessLabel = [[UILabel alloc] init];
        _videoAccessLabel.text = @"无摄像头访问权限";
    }
    return _videoAccessLabel;
}

- (UILabel *)audioAccessLabel {
    if (!_audioAccessLabel) {
        _audioAccessLabel = [[UILabel alloc] init];
        _audioAccessLabel.text = @"无麦克风访问权限";
    }
    return _audioAccessLabel;
}

- (UILabel *)photoAccessLabel {
    if (!_photoAccessLabel) {
        _photoAccessLabel = [[UILabel alloc] init];
        _photoAccessLabel.text = @"无相册访问权限";
    }
    return _photoAccessLabel;
}

@end
