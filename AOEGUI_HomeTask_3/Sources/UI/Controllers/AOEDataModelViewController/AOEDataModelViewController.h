//
//  AOETableViewController.h
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 20.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AOEModelObserver.h"

@class AOEDataArrayModel;

@interface AOEDataModelViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, AOEModelObserver>
@property (nonatomic, strong)   AOEDataArrayModel   *arrayModel;

@end
