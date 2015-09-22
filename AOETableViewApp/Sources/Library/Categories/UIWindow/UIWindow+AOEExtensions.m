//
//  UIWindow+AOEExtensions.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 20.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "UIWindow+AOEExtensions.h"

@implementation UIWindow (AOEExtensions)

+ (id)window {
    return [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
