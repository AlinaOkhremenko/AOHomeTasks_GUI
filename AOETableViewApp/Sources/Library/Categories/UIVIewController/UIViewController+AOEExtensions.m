//
//  UIViewController+AOEExtensions.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 20.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "UIViewController+AOEExtensions.h"

@implementation UIViewController (AOEExtensions)

+ (id)viewController {
    return [[self alloc] initWithNibName:[self nibName] bundle:nil];
}

+ (id)nibName {
    return nil;
}

@end
