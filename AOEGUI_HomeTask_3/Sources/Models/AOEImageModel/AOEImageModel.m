//
//  AOEImageModel.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 26.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEImageModel.h"

static NSString * const kAOEImageName       = @"kAOEImageName";
static NSString * const kAOEImageExtension  = @"jpeg";
static NSString * const kAOEKeyUrl          = @"url";
static NSString * const kAOENamePicture     = @"cat";

@implementation AOEImageModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)catImageModel {
    static AOEImageModel *catPicture = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        catPicture = [[self alloc] initWithUrl:[[NSBundle mainBundle] URLForResource:kAOENamePicture withExtension:kAOEImageExtension]];
    });
    
    return catPicture;
}

#pragma mark -
#pragma mark Initialization Method

- (id)initWithUrl:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    return self;
}

#pragma mark - 
#pragma mark Accessors

- (UIImage *)picture {
    static UIImage *__picture = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSData *fileFromUrl = [NSData dataWithContentsOfURL:self.url];
        __picture = [UIImage imageWithData:fileFromUrl];
    });
    
    return __picture;
}

#pragma mark -
#pragma mark NSCoding Protocol

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        self.url = [decoder decodeObjectForKey:kAOEKeyUrl];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.url forKey:kAOEKeyUrl];
}

@end
