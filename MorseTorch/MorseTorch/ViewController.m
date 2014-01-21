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
    
    isOn = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSOperationQueue *downloadQueue = [NSOperationQueue new];
    [downloadQueue addOperationWithBlock:^{
        // This is running on a background thread.
    }];
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
        NSLog(@"string is illegal");
    } else {
        for (int i = 0; i < textField.text.length; i++) {
            character = [textField.text substringWithRange:NSMakeRange(i, 1)];
        }
    }
    
    NSString *morseString = [NSString morseStringFromString:textField.text];
    displayCodeLabel.text = morseString;
    
    NSString *morseCharacter;
    
    NSTimeInterval dot = 1;
    
    for (int i = 0; i < morseString.length; i++) {
        morseCharacter = [morseString substringWithRange:NSMakeRange(i, 1)];
        NSLog(@"%@, %@", morseCharacter, character);
        if ([morseCharacter isEqualToString:DOT]) {
            isOn = YES;
            [self performSelector:@selector(toggleTorch:) withObject:nil afterDelay:dot];
        } else {
            isOn = YES;
        }
    }
    
    return YES;
}

- (void)dismissKeyboard
{
    for (UIControl *aControl in self.view.subviews) {
        [aControl endEditing:YES];
    }
}

- (void)toggleTorch:(BOOL)onOrOff
{
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    [captureDevice lockForConfiguration:nil];
    [captureDevice setTorchMode:onOrOff ? AVCaptureTorchModeOn : AVCaptureTorchModeOff];
    [captureDevice unlockForConfiguration];
    
}

- (IBAction)toggleLight:(id)sender
{
    [self toggleTorch:isOn];
}

@end









