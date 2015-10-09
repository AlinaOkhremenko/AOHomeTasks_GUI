//
//  NSString+AOEExtensions.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 26.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "NSString+AOEExtensions.h"

static const NSUInteger kAOELowerBoundLength = 1;
static const NSUInteger kAOEUpperBoundLength = 15;

@implementation NSString (AOEExtensions)

+ (id)randomStringWith:(NSUInteger)length
           andAlphabet:(AOAlphabet *)alphabet
{
    NSMutableString *string = [NSMutableString stringWithCapacity:length];
    
    for (uint i = 0; i < length; i++) {
        [string appendFormat:@"%@",[alphabet getRandomLetter]];
    }
    
    return [string copy];
}

+ (id)randomString {
    NSUInteger length = arc4random_uniform(kAOEUpperBoundLength) + kAOELowerBoundLength;
    
    AOAlphabet *alphabetWithLowerCase = [AOAlphabet alphabetWithLowercaseLetters];
    AOAlphabet *alphabetWithUpperCase = [AOAlphabet alphabetWithUppercaseLetters];
    
    NSString *randomLowerCaseString = [self randomStringWith:length
                                                 andAlphabet:alphabetWithLowerCase];
    NSString *randomUpperCaseString = [self randomStringWith:kAOELowerBoundLength
                                                 andAlphabet:alphabetWithUpperCase];
    
    return [self stringWithFormat:@"%@%@",randomUpperCaseString, randomLowerCaseString];
}

@end
