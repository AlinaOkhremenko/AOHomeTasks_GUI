//
//  AOEChangesModelTwoIndices.h
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 03.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEChangesModel.h"

@interface AOEDoubleIndexChangesModel : AOEChangesModel
@property (nonatomic, assign)   NSUInteger  fromIndex;
@property (nonatomic, assign)   NSUInteger  toIndex;

+ (instancetype)modelFromIndex:(NSUInteger)fromIndex
                       toIndex:(NSUInteger)toIndex
                          type:(AOEModelChangeType)type;

@end
