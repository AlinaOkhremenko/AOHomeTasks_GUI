//
//  AOEChangesModel.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 03.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEChangesModel.h"
#import "AOEDoubleIndexChangesModel.h"
#import "AOEIndexChangesModel.h"

@interface AOEChangesModel ()
@property(nonatomic, assign) AOEModelChangeType type;

@end

@implementation AOEChangesModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)modelWithType:(AOEModelChangeType)type {
    AOEChangesModel *model = [self new];
    model.type = type;
    
    return model;
}

+ (AOEIndexChangesModel *)insertModelWithIndex:(NSUInteger)index {
    return [AOEIndexChangesModel modelWithIndex:index
                                           type:AOEModelChangeTypeInsert];
}

+ (AOEIndexChangesModel *)deleteModelWithIndex:(NSUInteger)index {
    return [AOEIndexChangesModel modelWithIndex:index
                                           type:AOEModelChangeTypeDelete];
}

+ (AOEDoubleIndexChangesModel *)moveModelFromIndex:(NSUInteger)fromIndex
                                           toIndex:(NSUInteger)toIndex
{
    return [AOEDoubleIndexChangesModel modelFromIndex:fromIndex
                                              toIndex:toIndex
                                                 type:AOEModelChangeTypeMove];
}

@end