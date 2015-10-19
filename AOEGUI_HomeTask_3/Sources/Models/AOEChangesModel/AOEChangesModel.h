//
//  AOEChangesModel.h
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 03.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//
#import <Foundation/Foundation.h>
@class AOEDoubleIndexChangesModel;
@class AOEIndexChangesModel;

typedef NS_ENUM(NSUInteger, AOEModelChangeType) {
    AOEModelChangeTypeInsert,
    AOEModelChangeTypeDelete,
    AOEModelChangeTypeMove
};

@interface AOEChangesModel : NSObject
@property (nonatomic, readonly) AOEModelChangeType type;

+ (instancetype)modelWithType:(AOEModelChangeType)type;

+ (AOEIndexChangesModel *)insertModelWithIndex:(NSUInteger)index;
+ (AOEIndexChangesModel *)deleteModelWithIndex:(NSUInteger)index;
+ (AOEDoubleIndexChangesModel *)moveModelFromIndex:(NSUInteger)fromIndex
                                           toIndex:(NSUInteger)toIndex;

@end
