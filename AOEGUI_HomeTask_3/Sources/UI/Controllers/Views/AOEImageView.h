//
//  AOEImageView.h
//  AOEGUI_HomeTask_3
//
//  Created by Alina Okhremenko on 01.11.15.
//  Copyright © 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEBaseView.h"
#import "AOEModelObserver.h"
@class AOEImageModel;

@interface AOEImageView : AOEBaseView <AOEModelObserver>
@property (nonatomic, strong) IBOutlet    UIImageView     *imageView;
@property (nonatomic, strong) AOEImageModel               *imageModel;

- (void)fillWithModel:(id)model;

@end
