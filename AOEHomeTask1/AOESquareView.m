//
//  AOESquareView.m
//  AOEHomeTask1
//
//  Created by Alina Okhremenko on 08.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOESquareView.h"

static const NSTimeInterval kAOESquareAnimationDuration = 0.5;

@implementation AOESquareView

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
        NSTimeInterval duration = animation ? kAOESquareAnimationDuration : 0;
        [UIView animateWithDuration:duration
                         animations:^{
                             self.center = [self positionForSquareView:squarePosition];
                         }
                         completion:^(BOOL finished) {
                             if (animationCompletion) {
                                 animationCompletion();
                             }
                         }
         ];
    }
}

#pragma mark - 
#pragma mark - Private Mathods

- (CGPoint)positionForSquareView:(AOSquarePosition)position {
    CGRect squareViewFrame = self.frame;
    CGRect viewBounds = self.superview.bounds;
    CGFloat widthFrame = CGRectGetWidth(squareViewFrame);
    CGFloat heightFrame = CGRectGetHeight(squareViewFrame);
    CGFloat widthBounds = CGRectGetWidth(viewBounds);
    CGFloat heightBounds = CGRectGetHeight(viewBounds);
    CGPoint point = CGPointZero;

    switch (self.squarePosition) {
        case AOSquarePositionLeftTopCorner:
            point = CGPointMake(widthFrame/2, heightFrame/2);
            break;
            
        case AOSquarePositionLeftBottomCorner:
            point = CGPointMake(widthFrame/2, (heightBounds - heightFrame/2));
            break;
            
        case AOSquarePositionRigthTopCorner:
            point = CGPointMake((widthBounds - widthFrame/2), heightFrame/2);
            break;
            
        case AOSquarePositionRigthBottomCorner:
            point = CGPointMake((widthBounds - widthFrame/2), (heightBounds - heightFrame/2));
            break;
            
        default:
            break;
            
    }
    
    return point;
}

@end
