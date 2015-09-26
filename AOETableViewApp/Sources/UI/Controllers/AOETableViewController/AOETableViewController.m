//
//  AOETableViewController.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 20.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOETableViewController.h"

#import "AOETableViewCell.h"
#import "AOEContainerView.h"
#import "AOEArrayModel.h"
#import "AOEDataModel.h"

#import "UITableView+AOEExtensions.h"
#import "AOEMacro.h"

AOEViewControllerClass(AOETableViewController, containerView, AOEContainerView);

@implementation AOETableViewController

#pragma mark - 
#pragma mark View Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = self.containerView.tableView;
    UINavigationItem *item = self.navigationItem;
    
    self.arrayModel = [AOEArrayModel new];
    [self.arrayModel addObject:[AOEDataModel new]];
    [tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark UITableViewDataSource protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AOETableViewCell *cell = [tableView dequeueCellWithType:[AOETableViewCell class]];
    cell.model = self.arrayModel[indexPath.row];
    return cell;
}

#pragma mark -
#pragma mark UITableViewDlegateProtocol

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //cell.backgroundColor = [UIColor lightGrayColor];
    
}

@end
