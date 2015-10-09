//
//  AOEDataArrayModel.h
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 22.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AOObservable.h"

@interface AOEArrayModel : AOEObservable
@property (nonatomic, readonly) NSUInteger  count;
@property (nonatomic, readonly) NSArray     *array;

- (void)addObject:(id)object;
- (void)removeObject:(id)object;

- (id)objectAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;

- (void)insertObject:(id)object atIndex:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
