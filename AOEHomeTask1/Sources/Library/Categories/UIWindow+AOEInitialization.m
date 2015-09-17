//
//  UIWindow+AOEInitialization.m
//  AOEHomeTask1
//
//  Created by Alina Okhremenko on 14.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "UIWindow+AOEInitialization.h"

@implementation UIWindow (AOEInitialization)

+ (id)window {
    return [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
