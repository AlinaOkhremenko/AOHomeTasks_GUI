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

static NSString * const kAOEKeyRandomString = @"kAOEKeyRandomString";
static NSString * const kAOEKeyImageModel   = @"kAOEKeyImageModel";
static NSString * const kAOEImageExtension  = @"jpeg";
static NSString * const kAOEKeyUrl          = @"url";
static NSString * const kAOEUrl             = @"https://lh4.googleusercontent.com/-zOPqgfb8Vw4/AAAAAAAAAAI/AAAAAAAAAVQ/6DRhCvLBVdc/photo.jpg";

@implementation AOEDataModel

#pragma mark -
#pragma mark Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        self.randomString = [NSString randomString];
        self.imageModel =  [AOEImageModel imageWithURL:[NSURL URLWithString:kAOEUrl]];
    }
    
    return self;
}

#pragma mark -
#pragma mark NSCoding Protocol

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        self.randomString = [decoder decodeObjectForKey:kAOEKeyRandomString];
        self.imageModel = [decoder decodeObjectForKey:kAOEKeyImageModel];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.randomString forKey:kAOEKeyRandomString];
    [coder encodeObject:self.imageModel forKey:kAOEKeyImageModel];
}

@end
