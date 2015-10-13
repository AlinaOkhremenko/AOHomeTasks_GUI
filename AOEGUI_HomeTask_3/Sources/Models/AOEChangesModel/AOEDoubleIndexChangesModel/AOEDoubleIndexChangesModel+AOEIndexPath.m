//
//  AOEDoubleIndexChangesModel+AOEIndexPath.m
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 14.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEDoubleIndexChangesModel+AOEIndexPath.h"

#import "NSIndexPath+AOEExtensions.h"

@implementation AOEDoubleIndexChangesModel (AOEIndexPath)

- (NSIndexPath *)destinationIndexPath {
    return [NSIndexPath indexPathForRow:self.toIndex];
}

- (NSIndexPath *)sourceIndexPath {
     return [NSIndexPath indexPathForRow:self.fromIndex];
}

@end
