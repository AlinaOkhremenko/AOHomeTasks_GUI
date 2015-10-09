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

static NSString * const kAOEKeyRandomString = @"randomString";
static NSString * const kAOEKeyImageModel   = @"imageModel";

@implementation AOEDataModel

#pragma mark -
#pragma mark Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        self.randomString = [NSString randomString];
        self.imageModel = [[AOEImageModel alloc] init];
    }
    
    return self;
}

#pragma mark -
#pragma mark NSCoding Protocol

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.randomString = [coder decodeObjectForKey:kAOEKeyRandomString];
        self.imageModel = [coder decodeObjectForKey:kAOEKeyImageModel];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.randomString forKey:kAOEKeyRandomString];
    [coder encodeObject:self.imageModel forKey:kAOEKeyImageModel];
}

@end
