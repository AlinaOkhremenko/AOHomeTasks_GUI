//
//  AOEImageModel.h
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 26.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface AOEImageModel : NSObject <NSCoding>
@property (nonatomic, strong)   NSURL       *url;
@property (nonatomic, readonly) UIImage     *picture;

+ (instancetype)catImageModel;

- (id)initWithUrl:(NSURL *)url;

@end
