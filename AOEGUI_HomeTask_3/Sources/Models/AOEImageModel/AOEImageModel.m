//
//  AOEImageModel.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 26.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEImageModel.h"
#import "AOEDataModelViewCell.h"

#import "AOECache.h"
#import "AOEFileImageModel.h"
#import "AOEURLImageModel.h"

#import "AOEMacro.h"
#import "AOEGCDQueues.h"

static NSString * const kAOEKeyUrl          = @"url";

@interface AOEImageModel ()

+ (AOECache *)currentCache;

@end

@implementation AOEImageModel

#pragma mark -
#pragma mark Class Methods

+ (AOECache *)currentCache {
    return [AOECache cache];
}

+ (instancetype)imageWithURL:(NSURL *)url {
    BOOL isSchemeOfFile = url.fileURL;
    Class imageClass = nil;
    if (isSchemeOfFile) {
        imageClass = [AOEFileImageModel class];
    } else {
        imageClass = [AOEURLImageModel class];
    }
    
    return [[imageClass alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initialization and Deallocation Method

- (void)dealloc {
    self.url = nil;
}

- (id)initWithURL:(NSURL *)url {
    AOECache *imageCache = [[self class] currentCache];
    id existedImageModel = [imageCache objectForKey:url];
    
    if (existedImageModel) {
        return existedImageModel;
    }
    self = [super init];
    if (self) {
        self.url = url;
        [imageCache addObject:self forKey:url];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)loadImageWithCompletionBlock:(void (^)(UIImage *image, id error))completionBlock {
}

- (void)cancel {
}

- (void)notifyOfLoadingImageState:(UIImage *)image error:(id)error {
    AOEweakify(self);
    AOEDispatchQueueAsyncOnMainThread(^{
        AOEstrongify(self);
        self.state = self.picture ? AOEModelStateDidLoad : AOEModelStateDidFailLoading;
    });
}

- (void)finishLoadingImage:(UIImage *)image error:(id)error {
    self.picture = image;
}

- (void)performLoading {
    AOEweakify(self);
    NSLog(@"performLoading");
    [self loadImageWithCompletionBlock:^(UIImage *image, id error) {
        AOEstrongify(self);
        [self finishLoadingImage:image error:error];
        [self notifyOfLoadingImageState:image error:error];
    }];
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
