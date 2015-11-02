//
//  AOEImageView.m
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 01.11.15.
//  Copyright © 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEImageView.h"
#import "AOEImageModel.h"

#import "AOEMacro.h"

@implementation AOEImageView

#pragma mark -
#pragma mark Accessors

- (void)setImageModel:(AOEImageModel *)imageModel {
    AOESynthesizeObserverSetter(imageModel, _imageModel);
    
    [self fillWithModel:imageModel];
    
    [imageModel load];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(AOEImageModel *)model {
    self.imageView.image = model.picture;
}

#pragma mark -
#pragma mark AOEObserver Protocol methods

- (void)modelWillLoad:(id)model {
    [self showLoadingView];
}

- (void)modelDidLoad:(id)model {
    [self fillWithModel:model];
    [self hideLoadingView];
}

- (void)modelDidFailLoading:(id)model {
    [self.imageModel load];
}

- (void)model:(id)arrayModel didChangeWithChangesModel:(id)changesModel {
}

@end
