//
//  AOELoadingView.m
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 15.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOELoadingView.h"
#import "UINib+AOEExtensions.h"
static const NSUInteger kAOEAnimationDuration = 2;
static const NSUInteger kAOEAnimationDelay    = 0;

@interface AOELoadingView ()

@property (nonatomic, readwrite) BOOL visible;

@end

@implementation AOELoadingView

#pragma mark -
#pragma mark Class Methods

+ (instancetype)loadingView {
    static AOELoadingView *__loadingView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __loadingView = [UINib objectWithClass:[AOELoadingView class]];
    });
    
    return __loadingView;
}

#pragma mark -
#pragma mark Accessors

- (void)setVisible:(BOOL)visible {
    [self setVisible:visible animated:NO];
}

- (void)setVisible:(BOOL)visible animated:(BOOL)animated {
    [self setVisible:visible animated:animated withCompletion:nil];
}

- (void)setVisible:(BOOL)visible animated:(BOOL)animated withCompletion:(void (^)())completion {
    UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
    NSTimeInterval animationDuration = animated ? kAOEAnimationDuration : 0;
    if (visible) {
        [mainWindow addSubview:self];
        self.frame = mainWindow.bounds;
        self.alpha = 0;
    }
    [UIView animateWithDuration:animationDuration
                          delay:kAOEAnimationDelay
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.alpha = visible ? 1 : 0;
                     }
                     completion: ^(BOOL finished){
                         if (!visible) {
                             [self removeFromSuperview];
                         }
                         if (completion) {
                             completion();
                         }
                         
                     }];
}

@end
