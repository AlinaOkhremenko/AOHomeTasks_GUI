//
//  AOECache.h
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 27.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AOECache : NSObject

+ (AOECache *)cache;

- (id)objectForKey:(id)key;
- (void)addObject:(id)object forKey:(id)key;
- (void)removeObjectForKey:(id)key;
- (void)removeAllObjects;

@end
