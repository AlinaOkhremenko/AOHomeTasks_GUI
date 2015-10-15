//
//  AOEChangesModel+UITableView.h
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 15.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//
#import <UIKit/UITableView.h>

#import "AOEChangesModel.h"

@interface AOEChangesModel (AOEExtensions)

- (void)applyToTableView:(UITableView *)tableView;
- (void)applyToTableView:(UITableView *)tableView
        withRowAnimation:(UITableViewRowAnimation)animation;

@end
