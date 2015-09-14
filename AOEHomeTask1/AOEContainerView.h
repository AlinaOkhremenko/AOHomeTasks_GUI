//
//  AOEСontainerView.h
//  AOEHomeTask1
//
//  Created by Alina Okhremenko on 14.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AOESquareView;

@interface AOEContainerView : UIView
@property (nonatomic, strong)     IBOutlet    AOESquareView      *squareView;
@property (nonatomic, strong)     IBOutlet    UIButton           *buttonMove;

@end
