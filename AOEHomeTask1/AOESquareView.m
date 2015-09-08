//
//  AOESquareView.m
//  AOEHomeTask1
//
//  Created by Alina Okhremenko on 08.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOESquareView.h"

@implementation AOESquareView

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
        completionHandler:(void (^)(void))animationCompletion
{
    if (_squarePosition != squarePosition) {
        _squarePosition = squarePosition;
        [UIView animateWithDuration:0.5
                         animations:^{
                             switch (self.squarePosition) {
                                 case AOSquarePositionLeftBottomCorner:
                                     self.frame = CGRectMake(0, 0, 0, 0);
                                     break;
                                 case AOSquarePositionLeftTopCorner:
                                     self.frame = CGRectMake(0, 0, 200, 100);
                                     break;
                                 case AOSquarePositionRigthBottomCorner:
                                     self.frame =CGRectMake(0, 0, 0, 0);
                                     break;
                                 case AOSquarePositionRigthTopCorner:
                                     self.frame = CGRectMake(0, 0, 0, 0);
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

                                                                                                                                  

@end
