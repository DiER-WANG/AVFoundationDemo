//
//  PPMediaCaptureAuthorizedFailureView.h
//  AVFoundationDemo
//
//  Created by 王昌阳 on 2019/5/6.
//  Copyright © 2019 王昌阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PPMediaCaptureAuthorizationStatusModel;

NS_ASSUME_NONNULL_BEGIN

@interface PPMediaCaptureAuthorizedFailureView : UIView


@property (nonatomic, strong) PPMediaCaptureAuthorizationStatusModel *status;

@end

NS_ASSUME_NONNULL_END
