//
//  AOEContainerView.h
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 20.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AOEBaseView.h"

@interface AOEDataModelView : AOEBaseView
@property (nonatomic, strong)   IBOutlet    UITableView    *tableView;

@end
