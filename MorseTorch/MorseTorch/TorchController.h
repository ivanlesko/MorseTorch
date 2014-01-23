//
//  TorchController.h
//  MorseTorch
//
//  Created by Ivan Lesko on 1/21/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

@protocol TorchControllerDelegate <NSObject>

- (void)currentMorseLetter:(NSString *)theLetter;

@end

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "ViewController.h"

@interface TorchController : NSObject
{
    AVCaptureDevice *captureDevice;
}

@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, strong) NSString *currentLetter;

@property (unsafe_unretained) id delegate;

+ (TorchController *)torchController;

- (void)longFlash;
- (void)shortFlash;
- (void)pauseAfterWord;

- (void)flashMorseForString:(NSString *)theString;

@end
