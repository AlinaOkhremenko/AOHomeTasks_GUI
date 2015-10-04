//
//  UITableView+AOEExtensions.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 22.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//
#import "UITableView+AOEExtensions.h"

#import "AOEChangesModel.h"
#import "AOEChangesModelOneIndex.h"
#import "AOEChangesModelTwoIndices.h"

#import "NSIndexPath+AOEExtensions.h"
#import "UINib+AOEExtensions.h"

@implementation UITableView (AOEExtensions)

#pragma mark -
#pragma mark Public Methods

- (id)dequeueCellWithType:(Class)class {
    id cell = [self dequeueReusableCellWithIdentifier:NSStringFromClass(class)];
    if (!cell) {
        cell = [UINib objectWithClass:class];
    }
    
    return cell;
}

- (void)adaptArrayModelwithChangesModel:(AOEChangesModel*)changesModel {
    AOEChangesModelOneIndex *modelOneIndex = nil;
    AOEChangesModelTwoIndices *modelTwoIndices = nil;
 
    switch (changesModel.type) {
        case AOEModelChangeTypeDelete:
            [self deleteRowsAtIndexPaths:@[[NSIndexPath indexPathByAddingRows:modelOneIndex.index]]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case AOEModelChangeTypeInsert:
            [self insertRowsAtIndexPaths:@[[NSIndexPath indexPathByAddingRows:modelOneIndex.index]]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case AOEModelChangeTypeMove:
            [self moveRowAtIndexPath:[NSIndexPath indexPathByAddingRows:modelTwoIndices.fromIndex]
                              toIndexPath:[NSIndexPath indexPathByAddingRows:modelTwoIndices.toIndex]];
            break;
    }

}
@end
