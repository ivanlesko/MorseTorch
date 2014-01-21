//
//  NSString+MorseCode.m
//  MorseTorch
//
//  Created by Ivan Lesko on 1/20/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "NSString+MorseCode.h"
#import "NSDictionary+MorseCode.h"

#define DOT  @"."
#define DASH @"-"



@implementation NSString (MorseCode)

- (NSArray *)symbolsForString
{
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i = 0; i < self.length; i++) {
        
        [tempArray addObject:[self symbolForLetter:[self substringWithRange:NSMakeRange(i, 1)]]];
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
    NSString *code = @"";
    
    for (int i = 0; i < theString.length; i++) {
        NSString *letter = [[theString substringWithRange:NSMakeRange(i, 1)] uppercaseString];
        
        for (NSString *theCode in [NSDictionary morseCode][letter]) {
            code = [code stringByAppendingString:theCode];
        }
    }
    
    return code;
}


@end
