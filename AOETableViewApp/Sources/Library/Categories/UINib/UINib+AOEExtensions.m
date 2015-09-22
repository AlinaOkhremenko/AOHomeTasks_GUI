//
//  UINib+AOEExtensions.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 22.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "UINib+AOEExtensions.h"

@implementation UINib (AOEExtensions)

#pragma mark -
#pragma mark Public Class Methods

+ (id)objectWithClass:(Class)class {
    return [self objectWithClass:class withOwner:nil inBundle:nil];
}

+ (id)objectWithClass:(Class)class withOwner:(id)owner {
    return [self objectWithClass:class withOwner:owner inBundle:nil];
}

+ (id)objectWithClass:(Class)class inBundle:(NSBundle *)bundle {
    return [self objectWithClass:class withOwner:nil inBundle:bundle];
}

+ (id)objectWithClass:(Class)class withOwner:(id)owner inBundle:(NSBundle *)bundle {
    UINib *nib = [self nibWithClass:class bundle:bundle];
    
    return [nib objectWithClass:class withOwner:owner];
}

+ (UINib *)nibWithClass:(Class)class {
    return [UINib nibWithClass:class bundle:nil];
}

+ (UINib *)nibWithClass:(Class)class bundle:(NSBundle *)bundle {
    return [UINib nibWithNibName:NSStringFromClass(class) bundle:bundle];
}

#pragma mark -
#pragma mark Public Methods

- (id)objectWithClass:(Class)class {
    NSArray *array = [self instantiateWithOwner:nil options:nil];
    for (id object in array) {
        if ([object isKindOfClass:class]) {
            return object;
        }
    }
    
    return nil;
}

- (id)objectWithClass:(Class)class withOwner:(id)owner {
    NSArray *array = [self instantiateWithOwner:owner options:nil];
    for (id object in array) {
        if ([object isKindOfClass:class]) {
            return object;
        }
    }
    
    return nil;
}



@end
