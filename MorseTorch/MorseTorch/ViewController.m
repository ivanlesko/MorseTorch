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
    
    UITapGestureRecognizer *dismissKeyboardTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:dismissKeyboardTap];
    
    self.textfield.delegate = self;
    
    self.torchController = [TorchController torchController];
    self.torchController.delegate = self;
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
    NSString *character;
    
    if ([textField.text rangeOfCharacterFromSet:[NSCharacterSet illegalCharacterSet]].location != NSNotFound) {
        displayCodeLabel.text = @"Invalid character used.  Please use A-Z and 0-9.";
    } else {
        for (int i = 0; i < textField.text.length; i++) {
            character = [textField.text substringWithRange:NSMakeRange(i, 1)];
        }
    }
    
    NSString *morseString = [NSString morseStringFromString:textField.text];
    NSArray  *morseArray = [morseString symbolsForString];
    
    [self.torchController flashForMorseArray:morseArray];
    
    displayCodeLabel.text = morseString;
    
    return YES;
}

- (void)dismissKeyboard
{
    for (UIControl *aControl in self.view.subviews) {
        [aControl endEditing:YES];
    }
}

#pragma mark - Torch Controller Delegate Methods


@end









