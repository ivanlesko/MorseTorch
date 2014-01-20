//
//  ViewController.m
//  MorseTorch
//
//  Created by Ivan Lesko on 1/20/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "ViewController.h"
#import "NSString+MorseCode.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *tempString;
    
    if (tempString) {
        NSArray *tempArray = tempString ? [tempString symbolsForString] : @[@"String Was Nil"];
        NSLog(@"%@", tempArray);
    } else {
        NSLog(@"temp string was nil");
    }
    
    self.textfield.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)translateToMorse:(id)sender
{
    NSLog(@"%@", self.textfield.text);
}



@end









