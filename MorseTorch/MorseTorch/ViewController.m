//
//  ViewController.m
//  MorseTorch
//
//  Created by Ivan Lesko on 1/20/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "ViewController.h"
#import "NSString+MorseCode.h"

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    NSCharacterSet *illegalSet = [[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789 "] invertedSet];
    
    if ([textField.text rangeOfCharacterFromSet:illegalSet].location != NSNotFound) {
        NSLog(@"string is illegal");
    } else {
        for (int i = 0; i < textField.text.length; i++) {
            character = [textField.text substringWithRange:NSMakeRange(i, 0)];
        }
    }
    
    NSString *morseString = [NSString morseStringFromString:textField.text];
    
    displayCodeLabel.text = morseString;
    
    return YES;
}

- (void)dismissKeyboard
{
    for (UIControl *aControl in self.view.subviews) {
        [aControl endEditing:YES];
    }
}

@end









