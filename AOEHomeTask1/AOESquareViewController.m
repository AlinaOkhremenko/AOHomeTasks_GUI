//
//  AOEViewController.m
//  AOEHomeTask1
//
//  Created by Alina Okhremenko on 08.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOESquareViewController.h"

@interface AOESquareViewController ()
@property (nonatomic, readonly)     AOEContainerView    *containerView;

- (void)moveSquareToNextPosition;

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
    self.squareAnimationOn = !self.squareAnimationOn;
    if (self.squareAnimationOn) {
        [self moveSquareToNextPosition];
    }
}

#pragma mark - 
#pragma mark - Private Methods

- (void)moveSquareToNextPosition {
    if (self.squareAnimationOn) {
        AOESquareView *squareView = self.containerView.squareView;
        NSInteger nextPosition = squareView.squarePosition + 1;
        nextPosition = nextPosition % AOSquarePositionCount;
        
        id __weak weakSelf = self;
        [squareView setSquarePosition:nextPosition
                             animated:YES
                    completionHandler:^{
                        id __strong strongSelf = weakSelf;
                        [strongSelf moveSquareToNextPosition];
                    }
         ];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
