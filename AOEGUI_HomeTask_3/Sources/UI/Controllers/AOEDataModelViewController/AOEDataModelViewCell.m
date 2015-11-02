//
//  AOETableViewCell.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 20.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//
#import "AOEDataModelViewCell.h"

#import "AOEDataModel.h"
#import "AOEMacro.h"
#import "AOEImageModel.h"
#import "AOEImageView.h"

@implementation AOEDataModelViewCell

#pragma mark -
#pragma mark Accessors

- (void)setModel:(AOEDataModel *)model {
    if (_model != model) {
        _model = model;
        [self fillWithModel:model];
    }
}

#pragma mark -
#pragma mark Public methods

- (void)fillWithModel:(AOEDataModel *)model {
    self.imageViewContainer.imageModel = model.imageModel;
    self.randomText.text = model.randomString;
}

@end
