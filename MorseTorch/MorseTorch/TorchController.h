//
//  TorchController.h
//  MorseTorch
//
//  Created by Ivan Lesko on 1/21/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface TorchController : NSObject
{
    AVCaptureDevice *captureDevice;
}

@property unsigned int unitDuration;
@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, strong) NSString *currentLetter;

+ (TorchController *)torchController;

- (void)longFlash;
- (void)shortFlash;
- (void)pauseAfterWord;

- (void)flashMorseForString:(NSString *)theString;

@end
