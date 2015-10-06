//
//  AOEChangesModelOneIndex.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 03.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEIndexChangesModel.h"

@implementation AOEIndexChangesModel

#pragma mark - 
#pragma mark Class Methods

+ (instancetype)modelWithIndex:(NSUInteger)index
                          type:(AOEModelChangeType)type
{
    AOEIndexChangesModel *model = [self modelWithType:type];
    model.index = index;
    
    return model;
}

@end
