//
//  AOEDataArrayModel.h
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 26.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.

#import <UIKit/UIKit.h>

#import "AOEModel.h"
#import "AOEImageModel.h"

@interface AOEDataModel : AOEModel <NSCoding>
@property (nonatomic, strong)   NSString        *randomString;
@property (nonatomic, strong)   AOEImageModel   *imageModel;

@end
