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
#import "AOEDoubleIndexChangesModel+AOEIndexPath.h"
#import "AOEIndexChangesModel+AOEIndexPath.h"
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

- (void)updateWithChangesModel:(id)changesModel {
    AOEIndexChangesModel *modelOneIndex = (AOEIndexChangesModel *)changesModel;
    AOEDoubleIndexChangesModel *modelTwoIndices = (AOEDoubleIndexChangesModel *)changesModel;
 
    switch ([modelOneIndex type]) {
        case AOEModelChangeTypeDelete:
            [self deleteRowsAtIndexPaths:@[[modelOneIndex destinationIndexPath]]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case AOEModelChangeTypeInsert:
            [self insertRowsAtIndexPaths:@[[modelOneIndex destinationIndexPath]]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case AOEModelChangeTypeMove:
            [self moveRowAtIndexPath:[modelTwoIndices sourceIndexPath]
                              toIndexPath:[modelTwoIndices destinationIndexPath]];
            break;
    }

}
@end
