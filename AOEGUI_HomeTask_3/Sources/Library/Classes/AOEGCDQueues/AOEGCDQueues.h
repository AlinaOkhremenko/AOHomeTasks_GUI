//
//  AOEGCDQueues.h
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 26.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <Foundation/Foundation.h>

void AOEDispatchQueueSyncOnMainThread(void(^block)(void));
void AOEDispatchQueueAsyncOnMainThread(void(^block)(void));
void AOEDispatchQueueAsyncInBackground(void(^block)(void));
