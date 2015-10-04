//
//  AOETableViewController.h
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 20.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AOEObserver.h"
@class AOEDataArrayModel;

@interface AOETableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, AOEObserver>
@property (nonatomic, strong)   AOEDataArrayModel   *arrayModel;

@end
