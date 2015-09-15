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

@interface AOESquareViewController ()
@property (nonatomic, readonly)     AOEContainerView    *containerView;

@end

@implementation AOESquareViewController

@dynamic containerView;

#pragma mark-
#pragma mark - Accessors

- (AOEContainerView *)containerView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[AOEContainerView class]]) {
        return (AOEContainerView *)self.view;
    }
    
    return nil;
}

#pragma mark - 
#pragma mark Public Methods Implementation

- (IBAction)onMoveSquareButton:(id)sender {
    BOOL newValue = !self.containerView.squareView.squareAnimationOn;
    self.containerView.squareView.squareAnimationOn = newValue;
    if (newValue) {
        [self.containerView.squareView moveSquareToNextPosition];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
