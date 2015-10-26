//
//  AOEFileImageModel.m
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 27.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEFileImageModel.h"

#import "NSFileManager+AOEExtensions.h"
#import "NSURL+MD5.h"

@implementation AOEFileImageModel

@dynamic fileName;
@dynamic fileFolder;
@dynamic filePath;
@dynamic cached;

#pragma mark -
#pragma mark Accessors

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
#pragma mark Public

- (void)downloadImageWithCompletionBlock:(void (^)(UIImage *, __autoreleasing id *))completionBlock {
    UIImage *image = [UIImage imageWithContentsOfFile:self.filePath];
    
    completionBlock(image, nil);
}


@end
