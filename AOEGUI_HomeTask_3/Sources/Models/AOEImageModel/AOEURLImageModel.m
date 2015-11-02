//
//  AOEURLImageModel.m
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 27.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEURLImageModel.h"

#import "AOEFileImageModel.h"

#import "NSURL+MD5.h"
#import "NSFileManager+AOEExtensions.h"
#import "AOEMacro.h"

static NSString * const kAOEDefaultImage = @"explorer.jpeg";

@interface AOEURLImageModel ()
@property (nonatomic, readonly)     NSString    *filePath;
@property (nonatomic, readonly)     NSString    *fileName;
@property (nonatomic, readonly)     NSString    *fileFolder;
@property (nonatomic, readonly, getter=isCached)    BOOL    cached;

@property (nonatomic, strong)   NSURLSession              *session;
@property (nonatomic, strong)   NSURLSessionDownloadTask  *downloadTask;

- (void)downloadImage:(void (^)(UIImage *image, id error))completion;
- (void)deleteFromCache;

@end

@implementation AOEURLImageModel

@dynamic fileName;
@dynamic fileFolder;
@dynamic filePath;
@dynamic cached;

#pragma mark -
#pragma mark Accessors

- (NSURLSession *)session {
    static NSURLSession *__session = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^ {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        __session = [NSURLSession sessionWithConfiguration:configuration];
    });
    
    return __session;
}

- (void)setDownloadTask:(NSURLSessionDownloadTask *)downloadTask {
    if (_downloadTask != downloadTask) {
        [_downloadTask cancel];
        
        _downloadTask = downloadTask;
        [_downloadTask resume];
    }
}

- (NSString *)fileName {
    return [self.url decimalMD5Value];
}

- (NSString *)fileFolder {
    return [NSFileManager userDocumentsPath];
}

- (NSString *)filePath {
    return [self.fileFolder stringByAppendingPathComponent:self.fileName];
}

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.filePath];
}

#pragma mark -
#pragma mark Public Methods

- (void)loadImageWithCompletionBlock:(void (^)(UIImage *image, id error))completionBlock {
    if (self.cached) {
        [super loadImageWithCompletionBlock:completionBlock];
        if (!self.picture) {
            [self deleteFromCache];
        }

    } else {
        [self downloadImage:completionBlock];
    }
}

- (void)cancel {
    self.downloadTask = nil;
}

#pragma mark -
#pragma mark Private Methods

- (void)downloadImage:(void (^)(UIImage *image, id error))completion {
    AOEweakify(self);
    self.downloadTask = [self.session downloadTaskWithURL:self.url
                                        completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
                                            AOEstrongify(self);
                                            if (nil == error) {
                                                [[NSFileManager defaultManager] copyItemAtURL:location
                                                                                        toURL:[NSURL fileURLWithPath:self.filePath]
                                                                                        error:&error];
                                                if (nil == error) {
                                                    [super loadImageWithCompletionBlock:completion];
                                                    
                                                    return ;
                                                }
                                                
                                                completion(nil, error);
                                            }
                                        }];
}

- (void)deleteFromCache {
    if (self.cached) {
        [[NSFileManager defaultManager] removeItemAtPath:self.filePath error:nil];
    }
}

@end
