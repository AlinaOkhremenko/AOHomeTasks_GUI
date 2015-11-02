//
//  NSURL+MD5.m
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 27.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "NSURL+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSURL (MD5)

- (NSString *)decimalMD5Value {
    const char *urlString = [[self absoluteString] UTF8String];
    unsigned char hashBytes[CC_MD5_DIGEST_LENGTH];
    CC_MD5(urlString,(CC_LONG)strlen(urlString), hashBytes);
    
    NSMutableString *hashString = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for ( NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++ ) {
        [hashString appendFormat:@"%02x", hashBytes[i]];
    }
    
    return [hashString copy];
}

@end
