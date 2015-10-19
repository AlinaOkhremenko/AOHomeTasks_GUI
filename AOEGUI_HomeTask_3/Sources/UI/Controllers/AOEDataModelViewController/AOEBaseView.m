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
@property (nonatomic, readwrite)    AOELoadingView  *loadingView;

@end
@implementation AOEBaseView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.loadingView = [AOELoadingView loadingView];
    [self.loadingView setVisible:NO animated:YES withCompletion:nil];
}

#pragma mark -
#pragma mark Public Methods

- (void)show {
    [self.loadingView setVisible:YES animated:YES withCompletion:nil];
}

- (void)hide {
    [self.loadingView setVisible:NO animated:NO];
}

- (BOOL)isHidden {
    return self.loadingView.hidden;
}

@end
