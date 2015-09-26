//
//  AOEImageModel.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 26.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEImageModel.h"

@implementation AOEImageModel

#pragma mark - 
#pragma mark Initialization Method

- (instancetype)initWithImageName:(NSString *)imageName {
    self = [super init];
    if (self) {
        self.picture = [UIImage imageNamed:imageName];
    }
    
    return self;
}


@end
