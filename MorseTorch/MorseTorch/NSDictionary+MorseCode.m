//
//  NSDictionary+MorseCode.m
//  MorseTorch
//
//  Created by Ivan Lesko on 1/21/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "NSDictionary+MorseCode.h"

@implementation NSDictionary (MorseCode)

+ (NSDictionary *)morseCode
{
    NSDictionary *morse = @{
        @"A" : @".-",
        @"B" : @"-...",
        @"C" : @"-.-.",
        @"D" : @"-..",
        @"E" : @".",
        @"F" : @"..-.",
        @"G" : @"--.",
        @"H" : @"....",
        @"I" : @".-",
        @"J" : @".---",
        @"K" : @"-.-",
        @"L" : @".-..",
        @"M" : @"--",
        @"N" : @"-.",
        @"O" : @"---",
        @"P" : @".--.",
        @"Q" : @"--.-",
        @"R" : @".-.",
        @"S" : @"...",
        @"T" : @"-",
        @"U" : @"..-",
        @"V" : @"...-",
        @"W" : @".--",
        @"X" : @"-..-",
        @"Y" : @"-.--",
        @"Z" : @"--..",
        
        @"1" : @".----",
        @"2" : @"..---",
        @"3" : @"...--",
        @"4" : @"....-",
        @"5" : @".....",
        @"6" : @"-....",
        @"7" : @"--...",
        @"8" : @"---..",
        @"9" : @"----.",
        @"0" : @"-----",
        
        @" " : @" " // Space
        };
    
    return morse;
}

@end
