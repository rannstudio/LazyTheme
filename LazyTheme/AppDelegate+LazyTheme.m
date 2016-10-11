//
//  AppDelegate+LazyTheme.m
//  LazyThemeDemo
//
//  Created by QiXin on 2016/10/3.
//  Copyright © 2016年 rannie. All rights reserved.
//

#import "AppDelegate+LazyTheme.h"
#import "LTTheme.h"
#import "LTThemeManager.h"
#import "LTRuntime.h"

@implementation AppDelegate (LazyTheme)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lt_swizzleMethod([self class], @selector(application:didFinishLaunchingWithOptions:), @selector(lt_application:didFinishLaunchingWithOptions:));
    });
}

- (BOOL)lt_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupTheme];
    return [self lt_application:application didFinishLaunchingWithOptions:launchOptions];
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
}

@end
