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

#pragma mark -
#pragma mark Public

- (void)loadImageWithCompletionBlock:(void (^)(UIImage *image, id error))completionBlock {
    UIImage *image = [UIImage imageWithContentsOfFile:[self.url path]];
    
    completionBlock(image, nil);
}

@end
