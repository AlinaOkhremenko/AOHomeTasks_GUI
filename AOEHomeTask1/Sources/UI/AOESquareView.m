//
//  AOESquareView.m
//  AOEHomeTask1
//
//  Created by Alina Okhremenko on 08.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOESquareView.h"
#import  "AOEMacro.h"

static const NSTimeInterval kAOESquareAnimationDuration = 0.5;

@interface AOESquareView ()
@property (nonatomic, assign)   BOOL   animationInProgress;

- (void)animateSquareView;

@end;

@implementation AOESquareView

#pragma mark -
#pragma mark Accessor Methods

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
        NSTimeInterval duration = animation ? kAOESquareAnimationDuration : 0;
        [UIView animateWithDuration:duration
                         animations:^{
                             self.frame = [self frameForSquareView:squarePosition];
                         }
                         completion:^(BOOL finished){
                             _squarePosition = squarePosition;
                             if (animationCompletion) {
                                 animationCompletion();
                             }
                         }];
    }
}

- (void)setAnimatingSquare:(BOOL)animatingSquare {
    if (animatingSquare != _animatingSquare) {
        _animatingSquare = animatingSquare;
        [self animateSquareView];
    }
}


#pragma mark -
#pragma mark Private Methods

- (void)animateSquareView {
    if (self.animatingSquare &&!self.animationInProgress) {
            self.animationInProgress = YES;
            AOEweakify(self);
            [self setSquarePosition:[self nextPosition]
                           animated:YES
                  completionHandler:^{
                      AOEstrongifyAndReturnIfNil(self);
                      self.animationInProgress = NO;
                      [self animateSquareView];
            }];
    }
}

- (AOSquarePosition)nextPosition {
    return (self.squarePosition + 1) % AOSquarePositionCount;
}

- (CGRect)frameForSquareView:(AOSquarePosition)position {
    CGRect squareViewFrame = self.frame;
    CGRect viewBounds = self.superview.bounds;
    CGPoint point = CGPointZero;
    CGFloat x = CGRectGetWidth(viewBounds) - CGRectGetWidth(squareViewFrame);
    CGFloat y = CGRectGetHeight(viewBounds) - CGRectGetHeight(squareViewFrame);
    
    switch (self.squarePosition) {
        case AOSquarePositionLeftBottomCorner:
            point.y = y;
            break;
            
        case AOSquarePositionRigthTopCorner:
            point.x = x;
            break;
            
        case AOSquarePositionRigthBottomCorner:
            point = CGPointMake(x, y);
            break;
            
        default:
            break;
            
    }
    
    squareViewFrame.origin = point;
    
    return squareViewFrame;
}

@end
