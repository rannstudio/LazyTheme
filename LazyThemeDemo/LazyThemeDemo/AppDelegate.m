//
//  AppDelegate.m
//  LazyThemeDemo
//
//  Created by Hanran Liu on 2016/9/20.
//  Copyright © 2016年 rannie. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupTheme];
    return YES;
}

- (void)setupTheme {
    LTTheme *theme = [[LTTheme alloc] init];
    theme.themeName = @"Green";
    theme.globalBackgroundColor = 0xF5F5F9;
    theme.globalThemeColor = 0x29AB91;
    
    LTTheme *theme_orange = [[LTTheme alloc] init];
    theme_orange.themeName = @"Orange";
    theme_orange.globalBackgroundColor = 0xF5F5F9;
    theme_orange.globalThemeColor = 0xFFB415;
    [[LTThemeManager sharedManager] setupThemes:@[theme, theme_orange]];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[LTThemeManager sharedManager] applyTheme:theme_orange];
    });
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end