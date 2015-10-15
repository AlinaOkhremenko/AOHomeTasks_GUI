//
//  AOEIndexChangesModel+AOEIndexPath.h
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 14.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AOEIndexChangesModel.h"

@interface AOEIndexChangesModel (AOEExtensions)

- (NSIndexPath *)destinationIndexPath;

- (void)applyToTableView:(UITableView *)tableView
        withRowAnimation:(UITableViewRowAnimation)animation;

@end
