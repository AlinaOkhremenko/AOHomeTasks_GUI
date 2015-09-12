//
//  AOEViewController.h
//  AOEHomeTask1
//
//  Created by Alina Okhremenko on 08.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AOESquareView.h"

typedef NS_ENUM (NSUInteger, AOSquarePosition) {
    AOSquarePositionLeftTopCorner,
    AOSquarePositionRigthTopCorner,
    AOSquarePositionRigthBottomCorner,
    AOSquarePositionLeftBottomCorner,
    
};

@interface AOESquareViewController : UIViewController
@property (nonatomic, weak) IBOutlet AOESquareView      *squareView;
@property (nonatomic, weak) IBOutlet UIButton           *buttonMove;

@property (nonatomic, assign)        AOSquarePosition   squarePosition;
@property (nonatomic, assign)        BOOL               squareAnimationOn;

- (void)setSquarePosition:(AOSquarePosition)squarePosition;
- (void)setSquarePosition:(AOSquarePosition)squarePosition animated:(BOOL)animation;
- (void)setSquarePosition:(AOSquarePosition)squarePosition
                 animated:(BOOL)animation
        completionHandler:(void(^)())animationCompletion;

- (IBAction)onMoveSquareButton:(id)sender;

@end
