//
//  AOEDataArrayModel.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 03.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEDataArrayModel.h"
#import "AOEDataModel.h"

static const NSUInteger kAOERowsCount = 12;

@implementation AOEDataArrayModel

#pragma mark - 
#pragma mark Initializations

- (id)init {
    return [self initWithCount:kAOERowsCount];
}

- (id)initWithCount:(NSUInteger)rowsCount {
    self = [super init];
    if (self) {
        [self fillArrayModelWithRows:rowsCount];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)fillArrayModelWithRows:(NSUInteger)rowsCount {
    for (NSUInteger index = 0; index < rowsCount; index++) {
        [self addObject:[AOEDataModel new]];
    }
}

@end
