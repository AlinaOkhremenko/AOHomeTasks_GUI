//
//  UIViewController+AOEInitialization.m
//  AOEHomeTask1
//
//  Created by Alina Okhremenko on 14.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "UIViewController+AOEInitialization.h"

@implementation UIViewController (AOEInitialization)

+ (id)viewController {
    return [[self alloc] initWithNibName:NSStringFromClass(self) bundle:nil];
}

@end
