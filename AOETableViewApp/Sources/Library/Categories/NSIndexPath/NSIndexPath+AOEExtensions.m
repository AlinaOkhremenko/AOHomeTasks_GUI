//
//  NSIndexPath+AOEExtensions.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 27.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//
#import <UIKit/UIKit.h>

#import "NSIndexPath+AOEExtensions.h"

@implementation NSIndexPath (AOEExtensions)

+ (NSIndexPath *)indexPathForRow:(NSInteger)row {
    return [self indexPathForRow:row inSection:0];
}

@end
