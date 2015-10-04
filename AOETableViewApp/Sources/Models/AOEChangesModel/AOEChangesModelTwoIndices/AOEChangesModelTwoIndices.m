//
//  AOEChangesModelTwoIndices.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 03.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEChangesModelTwoIndices.h"

@implementation AOEChangesModelTwoIndices

#pragma mark - 
#pragma mark Class Methods

+ (instancetype)modelFromIndex:(NSUInteger)fromIndex
                       toIndex:(NSUInteger)toIndex
                          type:(AOEModelChangeType)type
{
    AOEChangesModelTwoIndices *model = [self modelWithType:type];
    model.toIndex = toIndex;
    model.fromIndex = fromIndex;
    
    return model;
}

@end
