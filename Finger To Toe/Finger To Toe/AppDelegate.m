//
//  AppDelegate.m
//  Finger To Toe
//
//  Created by Anas Bouzoubaa on 29/11/15.
//  Copyright © 2015 Small Data Lab. All rights reserved.
//

#import "AppDelegate.h"
#import <SingleLineInput/SingleLineTextField.h>

NSString * const USER_HAS_SIGNED_UP = @"USER_HAS_SIGNED_UP";

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // If user hasn't signed up yet, reroute app flow
    if (![[NSUserDefaults standardUserDefaults] boolForKey:USER_HAS_SIGNED_UP]) {
        [self.window setRootViewController:[self.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"signupViewController"]];
    }
    
    // Customize input fields
    [[SingleLineTextField appearance] setLineNormalColor:[UIColor grayColor]];
    [[SingleLineTextField appearance] setLineSelectedColor:[UIColor colorWithRed:0.1446 green:0.4927 blue:1.0 alpha:1.0]];
    [[SingleLineTextField appearance] setInputPlaceHolderColor:[UIColor grayColor]];
    [[SingleLineTextField appearance] setInputFont:[UIFont boldSystemFontOfSize:16]];
    [[SingleLineTextField appearance] setPlaceHolderFont:[UIFont boldSystemFontOfSize:14]];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
