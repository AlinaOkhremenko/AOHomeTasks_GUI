 //
//  UITableView+AOEExtensions.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 22.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//
#import "UITableView+AOEExtensions.h"

#import "AOEChangesModel.h"
#import "AOEIndexChangesModel.h"
#import "AOEDoubleIndexChangesModel.h"

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

- (void)updateWithChangesModel:(AOEChangesModel *)changesModel {
    AOEIndexChangesModel *modelOneIndex = nil;
    AOEDoubleIndexChangesModel *modelTwoIndices = nil;
 
    switch (changesModel.type) {
        case AOEModelChangeTypeDelete:
            modelOneIndex = (AOEIndexChangesModel *)changesModel;
            [self deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:modelOneIndex.index]]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case AOEModelChangeTypeInsert:
            modelOneIndex = (AOEIndexChangesModel *)changesModel;
            [self insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:modelOneIndex.index]]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case AOEModelChangeTypeMove:
            modelTwoIndices = (AOEDoubleIndexChangesModel *)changesModel;
            [self moveRowAtIndexPath:[NSIndexPath indexPathForRow:modelTwoIndices.fromIndex]
                              toIndexPath:[NSIndexPath indexPathForRow:modelTwoIndices.toIndex]];
            break;
    }

}
@end
