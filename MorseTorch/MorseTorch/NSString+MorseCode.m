//
//  NSString+MorseCode.m
//  MorseTorch
//
//  Created by Ivan Lesko on 1/20/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "NSString+MorseCode.h"

#define DOT  @"."
#define DASH @"-"



@implementation NSString (MorseCode)

- (NSArray *)symbolsForString
{
    NSString *noSpaceString = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i = 0; i < noSpaceString.length; i++) {
        
        [tempArray addObject:[self symbolForLetter:[noSpaceString substringWithRange:NSMakeRange(i, 1)]]];
    }
    
    return [NSArray arrayWithArray:tempArray];
}

- (NSString *)symbolForLetter:(NSString *)theLetter;
{
    if ([theLetter rangeOfString:@" "].location == NSNotFound) {
        theLetter = [theLetter uppercaseString];
        return theLetter;
    } else {
        return @"no white space";
    }
    
    return theLetter;
}

+ (NSString *)morseStringFromString:(NSString *)theString
{
    NSDictionary *morse = @{
              @"A" : @[DOT, DASH],
              @"B" : @[DASH, DOT, DOT, DOT],
              @"C" : @[DASH, DOT, DASH, DOT],
              @"D" : @[DASH, DOT, DOT],
              @"E" : @[DOT],
              @"F" : @[DOT, DOT, DASH, DOT],
              @"G" : @[DASH, DASH, DOT],
              @"H" : @[DOT, DOT, DOT, DOT],
              @"I" : @[DOT, DASH],
              @"J" : @[DOT, DASH, DASH, DASH],
              @"K" : @[DASH, DOT, DASH],
              @"L" : @[DOT, DASH, DOT, DOT],
              @"M" : @[DASH, DASH],
              @"N" : @[DASH, DOT],
              @"O" : @[DASH, DASH, DASH],
              @"P" : @[DOT, DASH, DASH, DOT],
              @"Q" : @[DASH, DASH, DOT, DASH],
              @"R" : @[DOT, DASH, DOT],
              @"S" : @[DOT, DOT, DOT],
              @"T" : @[DASH],
              @"U" : @[DOT, DOT, DASH],
              @"V" : @[DOT, DOT, DOT, DASH],
              @"W" : @[DOT, DASH, DASH],
              @"X" : @[DASH, DOT, DOT, DASH],
              @"Y" : @[DASH, DOT, DASH, DASH],
              @"Z" : @[DASH, DASH, DOT, DOT],
              
              @"1" : @[DOT, DASH, DASH, DASH, DASH],
              @"2" : @[DOT, DOT, DASH, DASH, DASH],
              @"3" : @[DOT, DOT, DOT, DASH, DASH],
              @"4" : @[DOT, DOT, DOT, DOT, DASH],
              @"5" : @[DOT, DOT, DOT, DOT, DOT],
              @"6" : @[DASH, DOT, DOT, DOT, DOT],
              @"7" : @[DASH, DASH, DOT, DOT, DOT],
              @"8" : @[DASH, DASH, DASH, DOT, DOT],
              @"9" : @[DASH, DASH, DASH, DASH, DASH, DOT],
              @"0" : @[DASH, DASH, DASH, DASH, DASH],
              
              @" " : @[DOT, DOT, DOT, DOT, DOT, DOT, DOT] // Space
              };
    
    NSString *code = @"";
    
    for (int i = 0; i < theString.length; i++) {
        NSString *letter = [[theString substringWithRange:NSMakeRange(i, 1)] uppercaseString];
        
        for (NSString *theCode in morse[letter]) {
            code = [code stringByAppendingString:theCode];
        }
    }
    
    return code;
}


@end
