//
//  AOEImageModel.h
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 26.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//
#import <UIKit/UIKit.h>

#import "AOEModel.h"

@interface AOEImageModel : AOEModel <NSCoding>
@property (nonatomic, strong)   NSURL       *url;
@property (nonatomic, strong)   UIImage     *picture;

+ (instancetype)imageWithURL:(NSURL *)url;

- (id)initWithURL:(NSURL *)url;

- (void)loadImageWithCompletionBlock:(void (^)(UIImage *image, id error))completionBlock;
- (void)cancel;
- (void)notifyOfLoadingImageState:(UIImage *)image error:(id)error;
- (void)finishLoadingImage:(UIImage *)image error:(id)error;

@end
