//
//  AOEIndexChangesModel+AOEIndexPath.m
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 14.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEIndexChangesModel+AOExtensions.h"
#import "NSIndexPath+AOEExtensions.h"

@implementation AOEIndexChangesModel (AOEExtensions)

- (NSIndexPath *)destinationIndexPath {
    return [NSIndexPath indexPathForRow:self.index];
}

- (void)applyToTableView:(UITableView *)tableView withRowAnimation:(UITableViewRowAnimation)animation {
    switch (self.type) {
        case AOEModelChangeTypeDelete:
            [tableView deleteRowsAtIndexPaths:@[[self destinationIndexPath]] withRowAnimation:animation];
            break;
            
        case AOEModelChangeTypeInsert:
            [tableView insertRowsAtIndexPaths:@[[self destinationIndexPath]] withRowAnimation:animation];
            break;
            
        default:
            break;
    }
}
@end
