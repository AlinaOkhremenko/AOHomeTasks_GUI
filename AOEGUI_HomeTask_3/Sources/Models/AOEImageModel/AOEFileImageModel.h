//
//  AOEFileImageModel.h
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 27.10.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEImageModel.h"

@interface AOEFileImageModel : AOEImageModel
@property (nonatomic, readonly)     NSString    *filePath;
@property (nonatomic, readonly)     NSString    *fileName;
@property (nonatomic, readonly)     NSString    *fileFolder;

@property (nonatomic, readonly, getter=isCached)    BOOL    cached;

@end
