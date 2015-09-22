//
//  AOETableViewCell.h
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 20.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AOETableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UIImageView  *pictureView;

+ (CGFloat)cellHeight;

@end