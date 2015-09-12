//
//  AOEViewController.m
//  AOEHomeTask1
//
//  Created by Alina Okhremenko on 08.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOESquareViewController.h"
#import "AOESquareView.h"

@interface AOESquareViewController ()

@end

@implementation AOESquareViewController

#pragma mark - 
#pragma mark - Accessor Methods

- (void)setSquarePosition:(AOSquarePosition)squarePosition {
    [self setSquarePosition:squarePosition animated:NO];
}

- (void)setSquarePosition:(AOSquarePosition)squarePosition
                 animated:(BOOL)animation
{
    [self setSquarePosition:squarePosition animated:YES completionHandler:nil];
    
}
- (void)setSquarePosition:(AOSquarePosition)squarePosition
                 animated:(BOOL)animation
        completionHandler:(void(^)())animationCompletion
{
    if (_squarePosition != squarePosition) {
        _squarePosition = squarePosition;
        [UIView animateWithDuration:0.5
                         animations:^{
                             CGRect frame = self.squareView.frame;
                             CGRect bounds = self.view.bounds;
                             CGFloat widthFrame = CGRectGetWidth(frame);
                             CGFloat heightFrame = CGRectGetHeight(frame);
                             CGFloat widthBounds = CGRectGetWidth(bounds);
                             CGFloat heightBounds = CGRectGetHeight(bounds);
                             
                             switch (self.squarePosition) {
                                 case AOSquarePositionLeftTopCorner:
                                     self.squareView.center = CGPointMake(widthFrame/2,heightFrame/2);
                                     break;
                                 case AOSquarePositionLeftBottomCorner:
                                     self.squareView.center = CGPointMake(widthFrame/2, (heightBounds -heightFrame/2));
                                     break;
                                 case AOSquarePositionRigthTopCorner:
                                     self.squareView.center = CGPointMake(widthBounds - widthFrame/2, heightFrame/2);
                                     break;
                                 case AOSquarePositionRigthBottomCorner:
                                     self.squareView.center = CGPointMake(widthBounds - widthFrame/2, heightBounds-heightFrame/2);
                                     break;
                             }
                         }
                         completion:^(BOOL finished) {
                             if (animationCompletion != nil) {
                                 animationCompletion();
                             }
                         }
         ];
    }
}

#pragma mark - 
#pragma mark Public Methods Implementation

- (IBAction)onMoveSquareButton:(id)sender {
    self.squareAnimationOn = !self.squareAnimationOn;
    if (self.squareAnimationOn)
    {
        [self moveSquareToNextPosition];
    }
}

#pragma mark - 
#pragma mark - Private Methods

- (void)moveSquareToNextPosition
{
    if (self.squareAnimationOn)
    {
        NSInteger nextPosition = _squarePosition + 1;
        nextPosition = nextPosition % 4;
        
        id __weak weakSelf = self;
        [self setSquarePosition:nextPosition
                       animated:YES
              completionHandler:^{
                  id __strong strongSelf = weakSelf;
                  [strongSelf moveSquareToNextPosition];
              }];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
