//
//  AOEDataArrayModel.h
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 26.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.

#import <UIKit/UIKit.h>

#import "AOEArrayModel.h"
#import "AOEImageModel.h"

@interface AOEDataModel : NSObject <NSCoding>
@property (nonatomic, strong)   NSString        *randomString;
@property (nonatomic, strong)   AOEImageModel   *imageModel;

@end
