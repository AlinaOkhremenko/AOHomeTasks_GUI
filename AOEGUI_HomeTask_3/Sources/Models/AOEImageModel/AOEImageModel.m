//
//  AOEImageModel.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 26.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEImageModel.h"

static NSString * const kAOEImageName       = @"cat";
static NSString * const kAOEImageExtension  = @"jpeg";
static NSString * const kAOEKeyUrl          = @"url";

@implementation AOEImageModel

#pragma mark - 
#pragma mark Initialization Method

- (id)init {
    self = [super init];
    if (self) {
        self.url = [[NSBundle mainBundle] URLForResource:kAOEImageName
                                           withExtension:kAOEImageExtension];
    }
    
    return self;
}

#pragma mark - 
#pragma mark Accessors

- (UIImage *)picture {
    static UIImage *__catPicture = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSData *fileFromUrl = [NSData dataWithContentsOfURL:self.url];
        __catPicture = [UIImage imageWithData:fileFromUrl];
    });
    
    return __catPicture;
}

#pragma mark -
#pragma mark NSCoding Protocol

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.url = [coder decodeObjectForKey:kAOEKeyUrl];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.url forKey:kAOEKeyUrl];
}

@end
