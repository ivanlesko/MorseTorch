//
//  NSString+MorseCode.m
//  MorseTorch
//
//  Created by Ivan Lesko on 1/20/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "NSString+MorseCode.h"

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
//    if ([theLetter rangeOfString:@" "].location == NSNotFound) {
//        theLetter = [theLetter uppercaseString];
//        return theLetter;
//    } else {
//        return @"no white space";
//    }
    
    return theLetter;
}


@end
