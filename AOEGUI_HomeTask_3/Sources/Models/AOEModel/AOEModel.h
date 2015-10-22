//
//  AOEModel.h
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 21.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//
#import <Foundation/Foundation.h>

#import "AOObservable.h"

typedef NS_ENUM(NSUInteger, AOEModelState) {
    AOEModelStateWillLoad,
    AOEModelStateDidLoad,
    AOEModelStateDidUnload,
    AOEModelStateDidFailLoading,
    AOEModelStateDidChange
};

@interface AOEModel : AOEObservable
@property (nonatomic, assign)   AOEModelState   state;

- (void)setState:(AOEModelState)state withObject:(id)object;

- (void)load;

/**
 * method to be overriden in subclasses
 */
- (void)setupLoading;

/**
 * method to be overriden in subclasses
 */
- (void)performLoading;

- (SEL)selectorForState:(AOEModelState)state;
- (void)performBlock:(void(^)(void))block shouldNotify:(BOOL)shouldNotify;

@end
