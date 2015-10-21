//
//  NSFileManager+AOEExtensions.m
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 20.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "NSFileManager+AOEExtensions.h"

@implementation NSFileManager (AOEExtensions)

+ (NSString *)userDocumentsPath {
    return [self pathWithSearchPathDirectory:NSDocumentDirectory domainMask:NSUserDomainMask];
}

+ (NSString *)pathWithSearchPathDirectory:(NSSearchPathDirectory)pathDirectory {
    return [self pathWithSearchPathDirectory:pathDirectory domainMask:NSUserDomainMask];
}

+ (NSString *)pathWithSearchPathDirectory:(NSSearchPathDirectory)pathDirectory
                               domainMask:(NSSearchPathDomainMask)domainMask
{
    return [NSSearchPathForDirectoriesInDomains(pathDirectory, domainMask, YES) firstObject];
}

@end
