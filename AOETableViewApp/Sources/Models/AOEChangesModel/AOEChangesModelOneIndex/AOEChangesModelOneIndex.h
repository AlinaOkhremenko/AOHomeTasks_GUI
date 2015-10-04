//
//  AOEChangesModelOneIndex.h
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 03.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEChangesModel.h"

@interface AOEChangesModelOneIndex : AOEChangesModel
@property (nonatomic)   NSUInteger  index;

+ (instancetype)modelWithIndex:(NSUInteger)index
                          type:(AOEModelChangeType)type;

@end