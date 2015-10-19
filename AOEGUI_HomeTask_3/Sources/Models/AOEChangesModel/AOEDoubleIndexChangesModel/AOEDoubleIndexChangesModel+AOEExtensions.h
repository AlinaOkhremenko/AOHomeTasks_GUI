//
//  AOEDoubleIndexChangesModel+AOEIndexPath.h
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 14.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "AOEDoubleIndexChangesModel.h"

@interface AOEDoubleIndexChangesModel (AOEExtensions)

- (NSIndexPath *)destinationIndexPath;
- (NSIndexPath *)sourceIndexPath;

@end
