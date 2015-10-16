//
//  AOELoadingView.h
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 15.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AOELoadingView : UIView
@property (nonatomic, readonly, getter=isVisible) BOOL visible;

+ (instancetype)loadingView;

- (void)setVisible:(BOOL)visible;
- (void)setVisible:(BOOL)visible animated:(BOOL)animated;
- (void)setVisible:(BOOL)visible animated:(BOOL)animated withCompletion:(void (^)())completion;

@end
