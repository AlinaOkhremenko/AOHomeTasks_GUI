//
//  AppDelegate.m
//  AOETableViewApp
//
//  Created by Alina Okhremenko on 20.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEAppDelegate.h"
#import "AOETableViewController.h"

#import "UIViewController+AOEExtensions.h"
#import "UIWindow+AOEExtensions.h"

@interface AOEAppDelegate ()

@end

@implementation AOEAppDelegate


- (BOOL)              application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    window.rootViewController = [AOETableViewController viewController];
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:window.rootViewController];
    window.rootViewController = navigationController;
    window.backgroundColor = [UIColor whiteColor];
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
