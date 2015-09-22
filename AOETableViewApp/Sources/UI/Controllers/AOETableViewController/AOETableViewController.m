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

#import "UITableView+AOEExtensions.h"

AOEViewControllerClass(AOETableViewController, containerView, AOEContainerView);

@implementation AOETableViewController

#pragma mark - 
#pragma mark Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    AOETableView *tableView = self.containerView.tableView;
    UINavigationItem *item = self.navigationItem;
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    [tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark UITableViewDataSource protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueCellWithType:[AOETableViewCell class]];
}

#pragma mark -
#pragma mark UITableViewDlegateProtocol

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.backgroundColor = [UIColor lightGrayColor];
    //cell.imageView.image = [UIImage imageNamed:@"CatImage"];
    cell.imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cat"ofType:@"jpeg"]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [AOETableViewCell cellHeight];
}


@end
