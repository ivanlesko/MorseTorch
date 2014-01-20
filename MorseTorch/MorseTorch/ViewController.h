//
//  ViewController.h
//  MorseTorch
//
//  Created by Ivan Lesko on 1/20/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
{
    NSDictionary *morse;
    
    __weak IBOutlet UILabel *displayCodeLabel;
}

@property (weak, nonatomic) IBOutlet UITextField *textfield;

@end
