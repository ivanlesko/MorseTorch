//
//  TorchController.h
//  MorseTorch
//
//  Created by Ivan Lesko on 1/21/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@protocol TorchControllerDelegate <NSObject>

- (NSArray *)morseArrayFromString:(NSString *)theString;

@end

@interface TorchController : NSObject
{
    AVCaptureDevice *captureDevice;
}

@property NSInteger unitDuration;
@property id delegate;
@property (nonatomic, strong) NSOperationQueue *operationQueue;

+ (TorchController *)torchController;

- (void)longFlash;
- (void)shortFlash;
- (void)pauseAfterWord;

@end
