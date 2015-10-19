//
//  AOEObserver.h
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 04.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AOEChangesModel;
@class AOEArrayModel;

@protocol AOEArrayModelObserver <NSObject>

- (void)        arrayModel:(AOEArrayModel *)arrayModel
 didChangeWithChangesModel:(AOEChangesModel *)changesModel;

@end
