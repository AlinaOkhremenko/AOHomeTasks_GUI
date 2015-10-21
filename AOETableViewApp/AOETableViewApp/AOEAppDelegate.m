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
@property (nonatomic, strong) AOEDataArrayModel *arrayModel;

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
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self.arrayModel saveDataArrayToFile];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self.arrayModel saveDataArrayToFile];
}

@end
