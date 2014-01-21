//
//  TorchController.m
//  MorseTorch
//
//  Created by Ivan Lesko on 1/21/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "TorchController.h"
#import <AVFoundation/AVFoundation.h>

@implementation TorchController

- (id)init
{
    self = [super init];
    if (self) {
        self.unitDuration = 10000;
    }
    
    return self;
}

+ (TorchController *)torchController
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init]; // or some other init method
    });
    
    return _sharedObject;
}

- (void)longFlash
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch]) {
        [device lockForConfiguration:nil];
        [device setTorchMode:AVCaptureTorchModeOn];
        usleep(self.unitDuration * 0.5);
        [device unlockForConfiguration];
    }
}

- (void)shortFlash
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch] && [device hasFlash]) {
        [device lockForConfiguration:nil];
        [device setTorchMode:AVCaptureTorchModeOn];
        usleep(self.unitDuration * 0.1);
        [device unlockForConfiguration];
    }
}

- (void)turnOnFlash:(AVCaptureDevice *)device
{
    
}

- (void)turnOffFlash:(AVCaptureDevice *)device
{
    
}

@end
