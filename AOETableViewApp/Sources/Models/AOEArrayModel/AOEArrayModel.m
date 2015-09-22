//
//  AOEDataArrayModel.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 22.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEArrayModel.h"

@interface AOEArrayModel ()
@property (nonatomic, strong)   NSMutableArray  *objects;

@end

@implementation AOEArrayModel

@dynamic count;
@dynamic array;

#pragma mark -
#pragma mark Initializations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.objects = [NSMutableArray new];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSUInteger)count {
    return self.objects.count;
}

- (NSArray *)array {
    return [self.objects copy];
}

#pragma mark -
#pragma mark Public Methods

- (void)addObject:(id)object {
    [self.objects addObject:object];
}

- (void)removeObject:(id)object {
    [self.objects removeObject:object];
}

- (id)objectAtIndex:(NSUInteger)index {
    return [self.objects objectAtIndex:index];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [self objectAtIndex:index];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    [self.objects removeObjectAtIndex:index];
}

- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    if (fromIndex < toIndex) {
        toIndex--;
    }
    id object = [self objectAtIndex:fromIndex];
    [self removeObjectAtIndex:fromIndex];
    [self.objects insertObject:object atIndex:toIndex];
}
    
@end
