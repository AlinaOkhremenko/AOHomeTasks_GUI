//
//  AOEBaseView.m
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 20.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEBaseView.h"
#import "AOELoadingView.h"

@interface AOEBaseView ()
@property (nonatomic, readwrite)    AOELoadingView      *loadingView;

@end
@implementation AOEBaseView

#pragma mark -
#pragma mark Deallocations

- (void)dealloc {
    self.loadingView = nil;
}

#pragma mark -
#pragma mark View Life Cycle Methods

- (void)awakeFromNib {
    [super awakeFromNib];
    
    AOELoadingView *loadingView = [self currentLoadingView];
    self.loadingView = loadingView;
    loadingView.visible = NO;
}

#pragma mark -
#pragma mark Accessors

- (BOOL)isLoadingViewHidden {
    return self.loadingView.visible;
}

#pragma mark -
#pragma mark Public Methods

- (id)currentLoadingView {
    return [AOELoadingView loadingView];
}

- (void)showLoadingView {
    AOELoadingView *loadingView = self.loadingView;
    [self bringSubviewToFront:loadingView];
    [loadingView setVisible:YES animated:YES];
}

- (void)hideLoadingView {
    [self.loadingView setVisible:NO animated:NO];
}

@end
