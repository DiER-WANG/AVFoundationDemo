//
//  ViewController.m
//  AVFoundationDemo
//
//  Created by 王昌阳 on 2019/4/29.
//  Copyright © 2019 王昌阳. All rights reserved.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "PPMeidaCaptureViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)play:(id)sender {
    PPMeidaCaptureViewController *vc = [[PPMeidaCaptureViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}


- (void)simplePlay {
    AVPlayer *player = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:@"https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8"]];
    AVPlayerViewController *vc = [[AVPlayerViewController alloc] init];
    vc.player = player;
    [self presentViewController:vc animated:YES completion:^{
        [player play];
    }];
}


@end
