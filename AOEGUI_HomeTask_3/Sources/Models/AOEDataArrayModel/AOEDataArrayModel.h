//
//  AOEDataArrayModel.h
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 03.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AOEArrayModel.h"

@interface AOEDataArrayModel : AOEArrayModel

- (id)init;
- (id)initWithCount:(NSUInteger)count;

- (void)saveDataArrayToFile;

@end
