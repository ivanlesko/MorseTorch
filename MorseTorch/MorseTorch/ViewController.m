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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UITapGestureRecognizer *dismissKeyboardTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:dismissKeyboardTap];
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
//    if ([textField.text rangeOfCharacterFromSet:[NSCharacterSet illegalCharacterSet]].location != NSNotFound) {
//        displayCodeLabel.text = @"Invalid character used.  Please use A-Z and 0-9.";
//    } else {
//        NSLog(@"%@", [NSString morseStringFromString:textField.text]);
//    }
    
    if ([self.torchController respondsToSelector:@selector(flashMorseForString:)]) {
        NSString *textForMorse = textField.text;
        textForMorse = [textForMorse uppercaseString];
        [self.torchController flashMorseForString:textForMorse];
    } else {
        NSLog(@"torch controller does not respond to flash Morse");
    }
    
    
    return YES;
}

- (void)dismissKeyboard
{
    for (UIControl *aControl in self.view.subviews) {
        [aControl endEditing:YES];
    }
}

@end









