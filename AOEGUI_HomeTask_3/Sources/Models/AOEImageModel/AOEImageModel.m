//
//  AOEImageModel.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 26.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEImageModel.h"
#import "AOEDataModelViewCell.h"

static NSString * const kAOEImageName       = @"kAOEImageName";
static NSString * const kAOEImageExtension  = @"jpeg";
static NSString * const kAOEKeyUrl          = @"url";
static NSString * const kAOENamePicture     = @"cat";

@implementation AOEImageModel

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
#pragma mark Public Methods

- (void)downloadImageWithURL:(NSURL *)url
             completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                                   if (!error) {
                                       UIImage *image = [[UIImage alloc] initWithData:data];
                                       completionBlock(YES, image);
                                   } else {
                                       completionBlock(NO, nil);
                                   }
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
