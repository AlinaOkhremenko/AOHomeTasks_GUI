//
//  AOETableViewCell.h
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 20.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AOEDataModel;

@interface AOETableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UIImageView  *pictureView;
@property (nonatomic, strong) IBOutlet UILabel      *randomText;

@property (nonatomic, strong) AOEDataModel     *model;

- (void)fillWithModel:(AOEDataModel*)model;

@end
