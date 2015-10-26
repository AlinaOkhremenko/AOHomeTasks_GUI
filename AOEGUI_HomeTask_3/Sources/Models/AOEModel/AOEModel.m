//
//  AOEModel.m
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 21.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//
#import "AOEModel.h"
#import "AOEModelObserver.h"
#import "AOObservable.h"

@implementation AOEModel

#pragma mark -
#pragma mark Initializations

- (id)init {
    self = [super init];
    if (self) {
    
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

#pragma mark -
#pragma mark Public Methods

- (void)load {
    AOEModelState state = self.state;
    if (state == AOEModelStateDidLoad || state == AOEModelStateWillLoad) {
        [self notifyObserversWithSelector:[self selectorForState:state]];
        
        return;
    }
    
    [self setupLoading];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
        [self performLoading];
    });
}

- (void)setupLoading {
    self.state = AOEModelStateWillLoad;
}

- (void)performLoading {
}

- (SEL)selectorForState:(NSUInteger)state {
    SEL selector = NULL;
    switch (state) {
        case AOEModelStateWillLoad:
            selector = @selector(modelWillLoad:);
            break;
            
        case AOEModelStateDidLoad:
            selector = @selector(modelDidLoad:);
            break;
            
        case AOEModelStateDidFailLoading:
            selector = @selector(modelDidFailLoading:);
            break;
            
        case AOEModelStateDidChange:
            selector = @selector(model:didChangeWithChangesModel:);
            break;
            
        default:
            [super selectorForState:state];
            break;
    }
    
    return selector;
}

@end
