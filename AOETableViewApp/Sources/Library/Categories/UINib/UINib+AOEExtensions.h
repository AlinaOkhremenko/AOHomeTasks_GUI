//
//  UINib+AOEExtensions.h
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 22.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (AOEExtensions)

+ (id)objectWithClass:(Class)cls;
+ (id)objectWithClass:(Class)cls withOwner:(id)owner;
+ (id)objectWithClass:(Class)cls withOwner:(id)owner inBundle:(NSBundle *)bundle;

+ (UINib *)nibWithClass:(Class)cls;
+ (UINib *)nibWithClass:(Class)cls bundle:(NSBundle *)bundle;

- (id)objectWithClass:(Class)cls;
- (id)objectWithClass:(Class)cls withOwner:(id)owner;

@end
