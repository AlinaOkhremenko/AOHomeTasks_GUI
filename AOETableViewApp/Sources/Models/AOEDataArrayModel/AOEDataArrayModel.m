//
//  AOEDataArrayModel.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 03.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEDataArrayModel.h"
#import "AOEDataModel.h"

@implementation AOEDataArrayModel

#pragma mark -
#pragma mark Public Methods

- (void)fillArrayModelWithRows:(NSUInteger)rows {
    for (NSUInteger index; index < rows; index++) {
        [self addObject:[AOEDataModel new]];
    }
}

@end
