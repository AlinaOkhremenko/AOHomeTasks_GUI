//
//  AOETableViewController.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 20.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOETableViewController.h"
#import "AOETableViewCell.h"
#import "UITableViewCell+AOEDequeueReusableCell.h"

AOEViewControllerClass(AOETableViewController, containerView, AOEContainerView);

@implementation AOETableViewController

#pragma mark - 
#pragma mark Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    AOETableView *tableView = self.containerView.tableView;
    [tableView reloadData];
    [tableView setDataSource:self];
    [tableView setDelegate:self];
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
    
    UITableViewCell *cell = [AOETableViewCell dequeueReusableCell:tableView];
    
    if (!cell) {
        
        UINib *nib = [UINib nibWithNibName:@"AOETableViewCell" bundle:nil];
        
        cell = [[nib instantiateWithOwner:self options:nil] firstObject];
        
        //NSBundle *bundle = [NSBundle mainBundle];
        
       // cell = [[bundle loadNibNamed:@"AOETableViewCell" owner:self options:nil] firstObject];
    }

    return cell;
}

#pragma mark -
#pragma mark UITableViewDlegateProtocol

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.backgroundColor = [UIColor lightGrayColor];
    cell.imageView.image = [UIImage imageNamed:@"CatImage"];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [AOETableViewCell cellHeight];
}




@end
