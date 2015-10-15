//
//  AppDelegate.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 20.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEAppDelegate.h"
#import "AOEDataModelViewController.h"
#import "AOEDataArrayModel.h"
#import "AOELoadingView.h"

#import "UIViewController+AOEExtensions.h"
#import "UIWindow+AOEExtensions.h"

@interface AOEAppDelegate ()
@property (nonatomic, strong) AOEDataModelViewController *viewController;

@end

@implementation AOEAppDelegate

- (BOOL)              application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    AOEDataModelViewController *viewController = [AOEDataModelViewController viewController];
    viewController.arrayModel = [AOEDataArrayModel new];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController: viewController];
    window.rootViewController = navigationController;
    [window makeKeyAndVisible];
    
    [[AOELoadingView loadingView] setVisible:YES animated:YES withCompletion:nil];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self.viewController.arrayModel saveDataArrayToFile];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    AOEDataArrayModel *newDataArray = [self.viewController.arrayModel loadDataArrayFromFile];
    self.viewController.arrayModel = newDataArray;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self.viewController.arrayModel saveDataArrayToFile];
}

@end
