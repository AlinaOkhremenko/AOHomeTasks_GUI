//
//  NSString+AOEExtensions.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 26.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "NSString+AOEExtensions.h"
#import <CommonCrypto/CommonDigest.h>

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

- (NSString *)decimalMD5Value {
    const char *urlString = [self UTF8String];
    unsigned char hashBytes[CC_MD5_DIGEST_LENGTH];
    CC_MD5(urlString,(CC_LONG)strlen(urlString), hashBytes);
    
    NSMutableString *hashString = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for ( NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++ ) {
        [hashString appendFormat:@"%02x", hashBytes[i]];
    }
    
    return [hashString copy];
}

@end
