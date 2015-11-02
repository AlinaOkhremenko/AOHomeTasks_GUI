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

#import "AOEGCDQueues.h"
#import "AOEMacro.h"

@implementation AOEModel

#pragma mark -
#pragma mark Public Methods

- (void)load {
    @synchronized(self) {
        AOEModelState state = self.state;
        if (state == AOEModelStateDidLoad || state == AOEModelStateWillLoad) {
            [self notifyObserversWithSelector:[self selectorForState:state]];
            
            return;
        }
        
        [self setupLoading];
    }
    AOEweakify(self);
    AOEDispatchQueueAsyncInBackground(^{
        AOEstrongify(self);
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
        case AOEModelStateDidUnload:
            selector = @selector(modelDidUnload:);
            break;
            
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
            selector = [super selectorForState:state];
            break;
    }
    
    return selector;
}

@end
