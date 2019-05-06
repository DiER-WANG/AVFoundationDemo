//
//  PPMediaCaptureAuthorizationStatusModel.h
//  AVFoundationDemo
//
//  Created by 王昌阳 on 2019/5/6.
//  Copyright © 2019 王昌阳. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PPMediaCaptureAuthorizationStatusModel : NSObject

@property (nonatomic, assign) BOOL allowVideo;
@property (nonatomic, assign) BOOL allowAudio;
@property (nonatomic, assign) BOOL allowPhoto;

@end

NS_ASSUME_NONNULL_END
