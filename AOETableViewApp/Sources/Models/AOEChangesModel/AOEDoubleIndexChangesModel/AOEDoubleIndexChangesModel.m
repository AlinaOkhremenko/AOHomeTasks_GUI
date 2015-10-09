//
//  AOEChangesModelTwoIndices.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 03.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEDoubleIndexChangesModel.h"

@implementation AOEDoubleIndexChangesModel

#pragma mark - 
#pragma mark Class Methods

+ (instancetype)modelFromIndex:(NSUInteger)fromIndex
                       toIndex:(NSUInteger)toIndex
                          type:(AOEModelChangeType)type
{
    AOEDoubleIndexChangesModel *model = [self modelWithType:type];
    model.fromIndex = fromIndex;
    model.toIndex = toIndex;
    
    return model;
}

@end
