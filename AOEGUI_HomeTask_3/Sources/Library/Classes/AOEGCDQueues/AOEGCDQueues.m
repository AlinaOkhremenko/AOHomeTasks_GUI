//
//  AOEGCDQueues.m
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 26.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEGCDQueues.h"

void AOEDispatchQueueSyncOnMainThread(void(^block)(void)) {
    if (block == nil) {
        
        return;
    }
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

void AOEDispatchQueueAsyncOnMainThread(void(^block)(void)) {
    if (block == nil) {
        
        return;
    } else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

void AOEDispatchQueueAsyncInBackground(void(^block)(void)) {
    if (block == nil) {
        
        return;
    } else {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), block);
    }
}
