//
//  AOETableViewCell.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 20.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOETableViewCell.h"
#import "AOEDataModel.h"

@implementation AOETableViewCell

#pragma mark -
#pragma mark Accessors

- (void)setModel:(AOEDataModel*)model {
    if (_model != model) {
        _model = model;
    }
     [self fillWithModel:model];
}

- (void)fillWithModel:(AOEDataModel*)model {
    self.pictureView.image = model.imageModel.picture;
    self.randomText.text = model.randomString;
}

@end
