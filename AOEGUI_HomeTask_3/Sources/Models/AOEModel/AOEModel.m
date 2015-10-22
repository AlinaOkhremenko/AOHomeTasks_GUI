//
//  AOEModel.m
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 21.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//
#import "AOEModel.h"
#import "AOEModelObserver.h"

@interface AOEModel ()
@property (nonatomic, assign)   BOOL    shouldNotify;

@end
@implementation AOEModel

#pragma mark -
#pragma mark Initializations

- (id)init {
    self = [super init];
    if (self) {
        self.shouldNotify = YES;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setState:(AOEModelState)state {
    [self setState:state withObject:nil];
}

- (void)setState:(AOEModelState)state withObject:(id)object {
    if (state != _state) {
        _state = state;
    }
    if (self.shouldNotify) {
        [self notifyObserversWithSelector:[self selectorForState:state] withObject:object];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)load {
    AOEModelState state = self.state;
    if (state == AOEModelStateDidLoad || state == AOEModelStateWillLoad) {
        [self notifyObserversWithSelector:[self selectorForState:state]];
    }
    
    self.state = AOEModelStateWillLoad;
    
    [self setupLoading];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
        [self performLoading];
    });
}

- (void)setupLoading {
}

- (void)performLoading {
}

- (SEL)selectorForState:(AOEModelState)state {
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
            break;
    }
    
    return selector;
}

- (void)performBlock:(void(^)(void))block shouldNotify:(BOOL)shouldNotify {
    BOOL currentNotifyingState = self.shouldNotify;
    self.shouldNotify = shouldNotify;
    if (block) {
        block();
    }
    
    self.shouldNotify = currentNotifyingState;
}

@end
