//
//  AOEDataArrayModel.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 26.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEDataModel.h"
#import "AOEImageModel.h"

#import "NSString+AOEExtensions.h"

static NSString * const kAOEImageName = @"cat";

@implementation AOEDataModel

#pragma mark -
#pragma mark Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        self.randomString = [NSString randomString];
        self.imageModel = [[AOEImageModel alloc] initWithImageName:kAOEImageName];
    }
    
    return self;
}

@end
