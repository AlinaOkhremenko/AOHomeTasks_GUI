//
//  AOEDataArrayModel.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 22.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEArrayModel.h"
#import "AOEChangesModel.h"
#import "AOEArrayModelObserver.h"

#import "NSMutableArray+AOEExtensions.h"
static  NSString * const kAOEKeyMutableObjects = @"objects";

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

- (void)insertObject:(id)object atIndex:(NSUInteger)index {
    [self.objects insertObject:object atIndex:index];
    
    [self notifyWithChangesModel:[AOEChangesModel insertModelWithIndex:index]];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    [self.objects removeObjectAtIndex:index];
    
    [self notifyWithChangesModel:[AOEChangesModel deleteModelWithIndex:index]];
}

- (void)moveObjectAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    [self.objects moveObjectAtIndex:fromIndex toIndex:toIndex];
    
    [self notifyWithChangesModel:[AOEChangesModel moveModelFromIndex:fromIndex toIndex:toIndex]];
}

- (void)notifyWithChangesModel:(id)model {
    [self notifyObserversWithSelector:@selector(arrayModel:didChangeWithChangesModel:)
                           withObject:self
                           withObject:model];
}

#pragma mark -
#pragma mark NSFastEnumeration Protocol

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(__unsafe_unretained id [])buffer
                                    count:(NSUInteger)len
{
    return [self.objects countByEnumeratingWithState:state objects:buffer count:len];
}

#pragma mark - 
#pragma mark NSCoding Protocol

- (id)initWithCoder:(NSCoder *)decoder{
    self = [super init];
    if (self) {
        self.objects = [decoder decodeObjectForKey:kAOEKeyMutableObjects];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.objects forKey:kAOEKeyMutableObjects];
}

@end
