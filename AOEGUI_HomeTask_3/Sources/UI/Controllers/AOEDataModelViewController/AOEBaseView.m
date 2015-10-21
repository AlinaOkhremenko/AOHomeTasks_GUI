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

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.loadingView = [self currentLoadingView];
    [self.loadingView setVisible:NO animated:NO];
}

#pragma mark -
#pragma mark Public Methods

- (id)currentLoadingView {
    return [AOELoadingView loadingView];
}

- (void)showLoadingView {
    [self.loadingView setVisible:YES animated:YES];
}

- (void)hideLoadingView {
    [self.loadingView setVisible:NO animated:NO];
}

- (BOOL)loadingViewIsHidden {
    return self.loadingView.alpha == 0;
}

@end
