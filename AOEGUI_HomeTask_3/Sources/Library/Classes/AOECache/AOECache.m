//
//  AOECache.m
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 27.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOECache.h"

@interface AOECache ()
@property (nonatomic, strong)   NSMapTable  *objects;

@end

@implementation AOECache

#pragma mark -
#pragma mark Class Methods

+ (AOECache *)cache {
    static AOECache *__cache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __cache = [[self alloc]init];
    });
    
    return __cache;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.objects = nil;
}

- (id)init {
    self = [super init];
    if (self) {
        self.objects = [NSMapTable strongToWeakObjectsMapTable];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (id)objectForKey:(id)key {
    return [self.objects objectForKey:key];
}

- (void)addObject:(id)object forKey:(id)key {
    [self.objects setObject:object forKey:key];
}

- (void)removeObjectForKey:(id)key {
    [self.objects removeObjectForKey:key];
}

- (void)removeAllObjects {
    [self.objects removeAllObjects];
}

@end
