//
//  UITableViewCell+AOEDequeueReusableCell.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 20.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "UITableViewCell+AOEDequeueReusableCell.h"

@implementation UITableViewCell (AOEDequeueReusableCell)

+ (NSString *)reuseIdentifier {
   return NSStringFromClass([self class]);
}

+ (UITableViewCell *)dequeueReusableCell:(UITableView*)tableView {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self reuseIdentifier]];
    
    return cell;
}

@end
