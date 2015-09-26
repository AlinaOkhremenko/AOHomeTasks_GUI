//
//  AOEImageModel.h
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 26.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AOEImageModel : NSObject
@property (nonatomic, strong)   UIImage     *picture;

- (instancetype)initWithImageName:(NSString *)imageName;

@end
