//
//  AOETableViewController.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 20.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//
#import "AOEDataModelViewController.h"

#import "AOEDataModelViewCell.h"
#import "AOEDataModelView.h"

#import "AOEDataArrayModel.h"
#import "AOEDataModel.h"
#import "AOEChangesModel.h"
#import "AOEIndexChangesModel.h"
#import "AOEDoubleIndexChangesModel.h"

#import "AOEArrayModelObserver.h"

#import "UITableView+AOEExtensions.h"
#import "NSIndexPath+AOEExtensions.h"
#import "AOEMacro.h"

static NSString * const kAOETableTitle = @"Data Table";

AOEViewControllerClass(AOEDataModelViewController, containerView, AOEDataModelView);

@implementation AOEDataModelViewController

#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.arrayModel = nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
         [self setupNavigationItem];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setArrayModel:(AOEDataArrayModel *)arrayModel {
    AOESynthesizeObserverSetter(arrayModel, _arrayModel);
}

#pragma mark - 
#pragma mark View LifeCycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.containerView.tableView reloadData];
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
    AOEDataModelViewCell *cell = [tableView dequeueCellWithType:[AOEDataModelViewCell class]];
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
    return self.editing == NO ? UITableViewCellEditingStyleNone : UITableViewCellEditingStyleDelete;
}

- (void)    tableView:(UITableView *)tableView
   commitEditingStyle:(UITableViewCellEditingStyle) editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.arrayModel removeObjectAtIndex:indexPath.row];
    }
}

- (BOOL)        tableView:(UITableView *)tableView
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
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self
                                                                               action:@selector(addNewRow)];
    item.rightBarButtonItem = addButton;
    item.leftBarButtonItem = self.editButtonItem;
    self.title = kAOETableTitle;
}

- (void)addNewRow {
    UITableView *tableView = self.containerView.tableView;
    [tableView beginUpdates];
    AOEArrayModel *model = self.arrayModel;
    [model addObject:[AOEDataModel new]];
    NSIndexPath *currentIndexPath = [NSIndexPath indexPathForRow:model.count - 1];
    [tableView insertRowsAtIndexPaths:@[currentIndexPath]
                                        withRowAnimation:UITableViewRowAnimationFade];
    [tableView endUpdates];
}

#pragma mark -
#pragma mark AOEModelObserver Protocol



- (void)        arrayModel:(AOEArrayModel *)arrayModel
 didChangeWithChangesModel:(AOEChangesModel *)changesModel
{
    [self.containerView.tableView updateWithChangesModel:changesModel];
}

@end
