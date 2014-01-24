//
//  ViewController.h
//  MorseTorch
//
//  Created by Ivan Lesko on 1/20/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TorchController.h"
#import <MBProgressHUD.h>

@class TorchController;

@interface ViewController : UIViewController <UITextFieldDelegate, TorchControllerDelegate>

- (IBAction)translate:(id)sender;
- (IBAction)stopTransmission:(id)sender;

@property (nonatomic, weak) IBOutlet UIButton *translateButton;
@property (nonatomic, weak) IBOutlet UIButton *stopButton;

@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (nonatomic) TorchController *torchController;

@property (nonatomic, weak) IBOutlet UILabel *displayCodeLabel;

// Torch Controller Delegate Methods

/** Displays the letter being transmitted in morse to view controller label. */
- (void)currentMorseLetter:(NSString *)theLetter;

/** Flashes the torch for a given string of letters and numbers. */
- (void)flashMorseForString:(NSString *)theString;

@end
