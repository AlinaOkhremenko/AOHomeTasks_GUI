//
//  AOETableViewCell.h
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 20.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//
#import <UIKit/UIKit.h>

#import "AOETableViewCell.h"

#import "AOEModelObserver.h"

@class AOEDataModel;
@class AOEImageView;

@interface AOEDataModelViewCell : AOETableViewCell 
@property (nonatomic, strong) IBOutlet AOEImageView             *imageViewContainer;
@property (nonatomic, strong) IBOutlet UILabel                  *randomText;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView  *imageLoadingWheel;

@property (nonatomic, strong)   AOEDataModel    *model;

- (void)fillWithModel:(AOEDataModel *)model;

@end
