//
//  LTThemeManager.m
//  LazyThemeDemo
//
//  Created by Hanran Liu on 2016/9/20.
//  Copyright © 2016年 rannie. All rights reserved.
//

#import "LTThemeManager.h"
#import "LTDefs.h"
#import "LTTheme.h"
#import "UIApplication+LazyTheme.h"
#import "UIViewController+LazyTheme.h"

@implementation LTThemeManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static LTThemeManager *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] initManager];
    });
    return instance;
}

- (instancetype)initManager {
    self = [super init];
    if (self) {
        _themeMap = [NSDictionary dictionary];
    }
    return self;
}

- (void)setupThemes:(NSArray<LTTheme *> *)themes {
    if (!themes || themes.count == 0) {
        LTLog(@"setup themes with empty array");
        return;
    }
    
    NSMutableDictionary *themeContent = [NSMutableDictionary dictionaryWithCapacity:themes.count];
    for (LTTheme *theme in themes) {
        [themeContent setObject:theme forKey:theme.themeName];
    }
    _themeMap = [themeContent copy];
    
    if (_currentTheme == nil) {
        [self applyTheme:_themeMap.allValues.firstObject];
    }
}

- (void)applyTheme:(LTTheme *)theme {
    NSAssert(theme, @"[LazyTheme] theme can not be nil");
    
    LTTheme *candidate = _themeMap[theme.themeName];
    if (!candidate) {
        NSMutableDictionary *newThemes = [_themeMap mutableCopy];
        [newThemes setObject:theme forKey:theme.themeName];
        _themeMap = [newThemes copy];
    }
    
    _currentTheme = theme;
    
    UIViewController *visibleVC = [UIApplication sharedApplication].currentVisibleViewController;
    if (visibleVC) {
        [visibleVC lt_modifyTheme];
    }
}

@end
