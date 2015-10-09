//
//  NSString+AOEExtensions.h
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 26.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AOAlphabet.h"

@interface NSString (AOEExtensions)
/**
 * returns random string with length and alphabet
 */
+ (id)randomStringWith:(NSUInteger)length
           andAlphabet:(AOAlphabet *)alphabet;

/** 
 * returns random string which contains of LowerCaseAlphabet and UpperCaseAlphabet
 */
+ (id)randomString;

@end
