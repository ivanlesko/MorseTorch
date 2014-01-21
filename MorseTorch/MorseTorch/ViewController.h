//
//  ViewController.h
//  MorseTorch
//
//  Created by Ivan Lesko on 1/20/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TorchController.h"

@interface ViewController : UIViewController <UITextFieldDelegate, TorchControllerDelegate>
{
    NSDictionary *morse;
    __weak IBOutlet UILabel *displayCodeLabel;
    BOOL isOn;
}

@property (weak, nonatomic) IBOutlet UITextField *textfield;

- (IBAction)toggleLight:(id)sender;

@end
