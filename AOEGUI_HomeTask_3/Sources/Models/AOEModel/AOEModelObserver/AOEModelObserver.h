//
//  AOEModelObserver.h
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 22.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AOEModelObserver <NSObject>

- (void)modelDidUnload:(id)model;
- (void)modelWillLoad:(id)model;
- (void)modelDidLoad:(id)model;
- (void)modelDidFailLoading:(id)model;

- (void)model:(id)arrayModel didChangeWithChangesModel:(id)changesModel;

@end
