//
//  TorchController.m
//  MorseTorch
//
//  Created by Ivan Lesko on 1/21/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "TorchController.h"

#define DOT  @"."
#define DASH @"-"

@implementation TorchController

- (id)init
{
    self = [super init];
    if (self) {
        self.unitDuration = 100000;
        captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        self.operationQueue = [NSOperationQueue new];
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
    [self turnOnFlash];
    usleep(self.unitDuration * 5);
    [self turnOffFlash];
    usleep(self.unitDuration * 2); // One-fifth of a second delay after every long flash.
    [captureDevice unlockForConfiguration];
    
}

- (void)shortFlash
{
    [self turnOnFlash];
    usleep(self.unitDuration * 1);
    [self turnOffFlash];
    usleep(self.unitDuration * 2); // One-fifth of a second delay after every short flash.
    [captureDevice unlockForConfiguration];
}

- (void)pauseAfterWord
{
    usleep(self.unitDuration * 10);
}

- (void)turnOnFlash
{
    if ([captureDevice hasTorch] && [captureDevice hasFlash]) {
        [captureDevice lockForConfiguration:nil];
        [captureDevice setTorchMode:AVCaptureTorchModeOn];
    }
}

- (void)turnOffFlash
{
    if ([captureDevice hasTorch] && [captureDevice hasFlash]) {
        [captureDevice lockForConfiguration:nil];
        [captureDevice setTorchMode:AVCaptureTorchModeOff];
    }
}

- (void)flashForMorseArray:(NSArray *)theArray
{
    [self.operationQueue addOperationWithBlock:^{
        for (NSString *letter in theArray) {
            if ([letter isEqualToString:DOT]) {
                [self shortFlash];
            } else if ([letter isEqualToString:DASH]) {
                [self longFlash];
            } if ([letter isEqualToString:@" "]) {
                [self pauseAfterWord];
            }
        }
    }];
    
}

@end










