//
//  NSFileManager+AOEExtensions.h
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 20.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (AOEExtensions)

+ (NSString *)userDocumentsPath;
+ (NSString *)pathWithSearchPathDirectory:(NSSearchPathDirectory)pathDirectory;
+ (NSString *)pathWithSearchPathDirectory:(NSSearchPathDirectory)pathDirectory
                               domainMask:(NSSearchPathDomainMask)domainMask;

@end
