//
//  AOETableViewCell.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 20.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//
#import "AOEDataModelViewCell.h"

#import "AOEDataModel.h"

static NSString * const kAOEUrl = @"https://lh4.googleusercontent.com/-zOPqgfb8Vw4/AAAAAAAAAAI/AAAAAAAAAVQ/6DRhCvLBVdc/photo.jpg";

@implementation AOEDataModelViewCell

#pragma mark -
#pragma mark Accessors

- (void)setModel:(AOEDataModel *)model {
    if (_model != model) {
        _model = model;
    }

    [self fillWithModel:model];
}

- (void)fillWithModel:(AOEDataModel *)model {
    NSURL *url = [NSURL URLWithString:kAOEUrl];
    [model.imageModel downloadImageWithURL:url completionBlock:^(BOOL succeeded, UIImage *image){
        if (succeeded) {
            self.pictureView.image = image;
        }
    }];
    self.randomText.text = model.randomString;
}

@end
