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
#import "AOEDataArrayModel.h"
#import "AOEDataModel.h"

#import "UITableView+AOEExtensions.h"
#import "NSIndexPath+AOEExtensions.h"
#import "AOEMacro.h"

AOEViewControllerClass(AOETableViewController, containerView, AOEContainerView);

@implementation AOETableViewController

#pragma mark - 
#pragma mark View LifeCycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = self.containerView.tableView;
   
    [self setupNavigationItem];
    self.arrayModel = [AOEDataArrayModel new];
    [self.arrayModel fillArrayModelWithRows:10];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark UITableViewDataSource protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AOETableViewCell *cell = [tableView dequeueCellWithType:[AOETableViewCell class]];
    cell.model = self.arrayModel[indexPath.row];
    
    return cell;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    
    [super setEditing:editing animated:animated];
    
    [self.containerView.tableView setEditing:editing animated:animated];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.editing == NO) {
        return UITableViewCellEditingStyleNone;
    }
    
    return UITableViewCellEditingStyleDelete;
}

- (void)    tableView:(UITableView *)tableView
   commitEditingStyle:(UITableViewCellEditingStyle) editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.arrayModel removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }
}

- (BOOL)    tableView:(UITableView *)tableView
canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)    tableView:(UITableView *)tableView
   moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
          toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.arrayModel moveObjectAtIndex:sourceIndexPath.row
                               toIndex:destinationIndexPath.row];
}

#pragma mark -
#pragma mark Private Methods

- (void)setupNavigationItem {
    UINavigationItem *item = self.navigationItem;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewRow)];
    item.rightBarButtonItem = addButton;
    item.leftBarButtonItem = self.editButtonItem;
    self.title = @"Data Table";
}

- (void)addNewRow {
    [self.containerView.tableView beginUpdates];
    AOEArrayModel *model = self.arrayModel;
    [model addObject:[AOEDataModel new]];
    NSIndexPath *currentIndexPath = [NSIndexPath indexPathByAddingRows:model.count - 1];
    [self.containerView.tableView insertRowsAtIndexPaths:@[currentIndexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self.containerView.tableView endUpdates];
}

@end
