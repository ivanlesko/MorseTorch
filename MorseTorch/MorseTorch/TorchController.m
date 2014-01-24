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
#define SPACE @" "
#define UNIT_DURATION 100000

@implementation TorchController

- (id)init
{
    self = [super init];
    if (self) {
        captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        self.operationQueue = [NSOperationQueue new];
        self.operationQueue.maxConcurrentOperationCount = 1;
        self.currentLetter = @"";
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
    usleep(UNIT_DURATION * 5);
    [self turnOffFlash];
    usleep(UNIT_DURATION * 2); // One-fifth of a second delay after every long flash.
    [captureDevice unlockForConfiguration];
    
}

- (void)shortFlash
{
    [self turnOnFlash];
    usleep(UNIT_DURATION * 1);
    [self turnOffFlash];
    usleep(UNIT_DURATION * 2); // One-fifth of a second delay after every short flash.
    [captureDevice unlockForConfiguration];
}

- (void)pauseAfterWord
{
    usleep(UNIT_DURATION * 10);
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

- (void)flashMorseForString:(NSString *)theString
{    
    // The length of the alphanumeric string being sent.
    for (int i = 0; i < theString.length; i++) {
        NSString *letter = [theString substringWithRange:NSMakeRange(i, 1)];
        
        // Update the View Controller's label.
        [self.operationQueue addOperationWithBlock:^{
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.delegate currentMorseLetter:letter];
            }];
        }];
        
        NSString *symbolForLetter = [NSDictionary morseCode][letter];
        
        // The length of each morse symbol for each letter in theString.
        for (int j = 0; j < symbolForLetter.length; j++) {

            NSLog(@"%@", [symbolForLetter substringWithRange:NSMakeRange(j, 1)]);
            
            [_operationQueue addOperationWithBlock:^{
                if ([[symbolForLetter substringWithRange:NSMakeRange(j, 1)] isEqualToString:DOT]) {
                    [self shortFlash];
                } else if ([[symbolForLetter substringWithRange:NSMakeRange(j, 1)] isEqualToString:DASH]) {
                    [self longFlash];
                } else if ([[symbolForLetter substringWithRange:NSMakeRange(j, 1)] isEqualToString:SPACE]) {
                    [self pauseAfterWord];
                } else {
                    NSLog(@"FATAL ERROR: Unrecognized Character sent to Torch Controller.");
                }
            }];
        }
    }
    
    // When the torch finishes flashing, enable the Translate button.
    [self.operationQueue addOperationWithBlock:^{
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.delegate callStopButton];
        }];
    }];
}

@end










