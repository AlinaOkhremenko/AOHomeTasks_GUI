////
////  AOSubject.m
////  ObjectiveC
////
////  Created by Alina Okhremenko on 03.08.15.
////  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
////
//
//#import "AOObservable.h"
//
//@interface AOEObservable ()
//@property (nonatomic, strong)    NSHashTable        *mutableObservers;
//
//@property (nonatomic, strong)   id<NSLocking>       stateLock;
//@property (atomic, strong)      dispatch_queue_t    queue;
//
//@end
//
//
//@implementation AOEObservable
//
//#pragma mark -
//#pragma mark Deallocation and Initialization Methods
//
//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        self.mutableObservers = [NSHashTable weakObjectsHashTable];
//        self.queue = dispatch_queue_create("observableQueue", DISPATCH_QUEUE_SERIAL);
//        self.stateLock = [NSLock new];
//    }
//    return self;
//}
//
//#pragma mark -
//#pragma mark - Accessors
//
//- (NSArray *)observers {
//    return [self.mutableObservers allObjects];
//}
//
////- (void)setState:(AOState)state {
////    [self.stateLock lock];
////        _state = state;
////    
////    [self.stateLock unlock];
////    
////    for (id<> observerObject in self.observers) {
////        [observerObject objectDidChangeState:self];
////    }
////}
//
////- (AOState)state {
////    [self.stateLock lock];
////    
////     AOState currentState = _state;
////    
////    [self.stateLock unlock];
////    
////    return currentState;
////}
//
//#pragma mark -
//#pragma mark  Public Methods
////
////- (void)addObserver:(id<>)observer {
////    @synchronized(self.mutableObservers) {
////        [self.mutableObservers addObject:observer];
////    }
////}
////
////- (void)removeObserver:(id<>)observer {
////    @synchronized(self.mutableObservers) {
////        [self.mutableObservers removeObject:observer];
////    }
////}
//
//@end
