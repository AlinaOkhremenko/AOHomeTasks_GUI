//
//  AOEViewController.m
//  AOEHomeTask1
//
//  Created by Alina Okhremenko on 08.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOESquareViewController.h"
#import "AOESquareView.h"
#import "AOEMacro.h"

AOEViewControllerClass(AOESquareViewController, containerView, AOEContainerView);

@implementation AOESquareViewController

#pragma mark -
#pragma mark Public Methods 

- (IBAction)onMoveSquareButton:(id)sender {
    BOOL newValue = !self.containerView.squareView.animatingSquare;
    self.containerView.squareView.animatingSquare = newValue;
}

#pragma mark -
#pragma mark Life Cycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
