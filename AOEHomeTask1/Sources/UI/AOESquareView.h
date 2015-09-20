//
//  AOESquareView.h
//  AOEHomeTask1
//
//  Created by Alina Okhremenko on 08.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSUInteger, AOSquarePosition) {
    AOSquarePositionLeftTopCorner,
    AOSquarePositionRigthTopCorner,
    AOSquarePositionRigthBottomCorner,
    AOSquarePositionLeftBottomCorner,
    AOSquarePositionCount
};

@interface AOESquareView : UIView
@property (nonatomic, assign)                             AOSquarePosition   squarePosition;
@property (nonatomic, assign, getter=isAnimatingSquare)   BOOL               animatingSquare;

- (void)setSquarePosition:(AOSquarePosition)squarePosition animated:(BOOL)animation;
- (void)setSquarePosition:(AOSquarePosition)squarePosition
                 animated:(BOOL)animation
        completionHandler:(void(^)())animationCompletion;

@end
