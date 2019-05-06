//
//  PPMediaCaptureAuthorizedFailureView.m
//  AVFoundationDemo
//
//  Created by 王昌阳 on 2019/5/6.
//  Copyright © 2019 王昌阳. All rights reserved.
//

#import "PPMediaCaptureAuthorizedFailureView.h"

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
    
}

@end
