//
//  NSString+MorseCode.h
//  MorseTorch
//
//  Created by Ivan Lesko on 1/20/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MorseCode)

- (NSArray *)symbolsForString;

- (NSString *)symbolForLetter:(NSString *)theLetter;

+ (NSString *)morseStringFromString:(NSString *)theString;

@end
