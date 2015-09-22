//
//  UITableView+AOEExtensions.h
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 22.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (AOEExtensions)

- (id)dequeueCellWithType:(Class)cls;

@end