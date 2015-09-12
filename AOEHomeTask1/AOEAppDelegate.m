//
//  AppDelegate.m
//  AOEHomeTask1
//
//  Created by Alina Okhremenko on 08.09.15.
//  Copyright (c) 2015 Alina Okhremenko. All rights reserved.
//

#import "AOEAppDelegate.h"
#import "AOESquareViewController.h"

@interface AOEAppDelegate ()

@end

@implementation AOEAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOption
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = window;
    
    window.rootViewController = [[AOESquareViewController alloc] initWithNibName:@"AOESquareViewController" bundle:nil];
    
    window.backgroundColor = [UIColor greenColor];
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
