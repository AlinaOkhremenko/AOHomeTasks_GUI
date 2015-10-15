//
//  AOEChangesModel+UITableView.m
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 15.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEChangesModel+AOEExtensions.h"

@implementation AOEChangesModel (AOEExtensions)

- (void)applyToTableView:(UITableView *)tableView {
    [self applyToTableView:tableView withRowAnimation:UITableViewRowAnimationFade];
}

- (void)applyToTableView:(UITableView *)tableView
        withRowAnimation:(UITableViewRowAnimation)animation
{
}

@end
