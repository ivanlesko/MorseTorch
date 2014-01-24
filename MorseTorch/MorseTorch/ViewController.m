//
//  ViewController.m
//  MorseTorch
//
//  Created by Ivan Lesko on 1/20/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "ViewController.h"
#import "NSString+MorseCode.h"
#import "NSDictionary+MorseCode.h"

#import <AVFoundation/AVFoundation.h>	

#define DOT  @"."
#define DASH @"-"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.textfield.delegate = self;
    self.torchController = [TorchController torchController];
    self.torchController.delegate = self;
    
    self.stopButton.enabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

#pragma mark - Textfield Delegate Methods

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField.text rangeOfCharacterFromSet:[NSCharacterSet illegalCharacterSet]].location != NSNotFound) {
        self.displayCodeLabel.text = @"Invalid character used.  Please use a-z and 0-9";
    }
    
    [self flashMorseForString:textField.text];
    
    [self dismissKeyboard];
    
    return NO;
}

- (void)flashMorseForString:(NSString *)theString
{
    if ([self.torchController respondsToSelector:@selector(flashMorseForString:)]) {
        NSString *textForMorse = theString;
        textForMorse = [textForMorse uppercaseString];
        [self.torchController flashMorseForString:textForMorse];
        
        self.stopButton.enabled = YES;
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismissKeyboard];
}

- (IBAction)translate:(id)sender
{
    if (self.textfield.text.length) {
        [self flashMorseForString:self.textfield.text];
        self.translateButton.enabled = NO;
        self.stopButton.enabled = YES;
        
        MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        progressHUD.mode = MBProgressHUDModeText;
        
        [self dismissKeyboard];
        
    } else {
        self.displayCodeLabel.text = @"Textfield must contain letters or numbers.";
    }
}

- (IBAction)stopTransmission:(id)sender
{
    [self callStopButton];
}

- (void)callStopButton
{
    self.stopButton.enabled = NO;
    self.translateButton.enabled = YES;
    
    self.textfield.text = @"";
    self.displayCodeLabel.text = @"";
    
    [[self.torchController operationQueue] cancelAllOperations];
    
    [self dismissKeyboard];
    
    MBProgressHUD *progressHUD = [MBProgressHUD HUDForView:self.view];
    [progressHUD hide:YES];
}

#pragma mark - Torch Controller Delegate Methods

- (void)currentMorseLetter:(NSString *)theLetter
{
    self.progressHud.labelText = theLetter;
    
    MBProgressHUD *progressHUD = [MBProgressHUD HUDForView:self.view];
    if (progressHUD) {
        progressHUD.labelText = theLetter;
    }
}

- (void)dismissKeyboard
{
    for (UIControl *aControl in self.view.subviews) {
        [aControl endEditing:YES];
    }
}

@end









