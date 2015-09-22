//
//  AOETableViewController.h
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 20.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AOEMacro.h"

@class AOEContainerView;
@class AOETableViewCell;
@class AOEArrayModel;

@interface AOETableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)   AOEArrayModel   *arrayModel;

@end
