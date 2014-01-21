//
//  NSDictionary+MorseCode.h
//  MorseTorch
//
//  Created by Ivan Lesko on 1/21/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (MorseCode)

/** Returns a dictionary of Morse Code symbols for letters and number */
+ (NSDictionary *)morseCode;

@end
