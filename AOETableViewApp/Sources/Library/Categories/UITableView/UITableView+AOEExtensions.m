//
//  UITableView+AOEExtensions.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 22.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "UITableView+AOEExtensions.h"
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

@end
