//
//  TorchController.h
//  MorseTorch
//
//  Created by Ivan Lesko on 1/21/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TorchControllerDelegate <NSObject>

// Delegate Methods

@end

@interface TorchController : NSObject

@property NSInteger unitDuration;
@property id delegate;

+ (TorchController *)torchController;

@end
