//
//  NSMutableArray+AOEExtensions.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 23.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "NSMutableArray+AOEExtensions.h"

@implementation NSMutableArray (AOEExtensions)

- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    id object = [self objectAtIndex:fromIndex];
    [self removeObjectAtIndex:fromIndex];
    [self insertObject:object atIndex:toIndex];
}

@end
