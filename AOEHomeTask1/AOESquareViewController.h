//
//  AOEViewController.h
//  AOEHomeTask1
//
//  Created by Alina Okhremenko on 08.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AOESquareView.h"
#import "AOEContainerView.h"

@interface AOESquareViewController : UIViewController
@property (nonatomic, weak)     AOESquareView   *squareView;

- (IBAction)onMoveSquareButton:(id)sender;

@end
