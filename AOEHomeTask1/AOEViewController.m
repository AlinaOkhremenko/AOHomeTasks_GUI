//
//  AOEViewController.m
//  AOEHomeTask1
//
//  Created by Alina Okhremenko on 08.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEViewController.h"
#import "AOESquareView.h"

@interface AOEViewController ()

@end

@implementation AOEViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[AOESquareView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
