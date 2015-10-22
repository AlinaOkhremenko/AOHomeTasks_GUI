//
//  AOEDataArrayModel.h
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 22.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AOEModel.h"

@interface AOEArrayModel : AOEModel <NSCoding, NSFastEnumeration>
@property (nonatomic, readonly) NSUInteger  count;
@property (nonatomic, readonly) NSArray     *array;

- (void)addObject:(id)object;
- (void)removeObject:(id)object;
- (void)addObjects:(id<NSFastEnumeration>)objects;
- (void)removeObjects:(id<NSFastEnumeration>)objects;

- (id)objectAtIndex:(NSUInteger)index;
- (NSUInteger)indexOfObject:(id)object; 
- (id)objectAtIndexedSubscript:(NSUInteger)index;

- (void)insertObject:(id)object atIndex:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
