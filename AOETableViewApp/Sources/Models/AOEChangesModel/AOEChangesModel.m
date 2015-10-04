//
//  AOEChangesModel.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 03.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEChangesModel.h"
#import "AOEChangesModelTwoIndices.h"
#import "AOEChangesModelOneIndex.h"

@interface AOEChangesModel ()
@property(nonatomic, assign) AOEModelChangeType type;

@end

@implementation AOEChangesModel

+ (instancetype)modelWithType:(AOEModelChangeType)type {
    AOEChangesModel *model = [self new];
    model.type = type;
    
    return model;
    
}

+ (AOEChangesModelOneIndex *)insertModelWithIndex:(NSUInteger)index {
    return [AOEChangesModelOneIndex modelWithIndex:index
                                              type:AOEModelChangeTypeInsert];
}

+ (AOEChangesModelOneIndex *)deleteModelWithIndex:(NSUInteger)index {
    return [AOEChangesModelOneIndex modelWithIndex:index
                                              type:AOEModelChangeTypeDelete];
}

+ (AOEChangesModelTwoIndices *)moveModelFromIndex:(NSUInteger)fromIndex
                                          toIndex:(NSUInteger)toIndex
{
    return [AOEChangesModelTwoIndices modelFromIndex:fromIndex
                                             toIndex:toIndex
                                                type:AOEModelChangeTypeMove];
}

@end
