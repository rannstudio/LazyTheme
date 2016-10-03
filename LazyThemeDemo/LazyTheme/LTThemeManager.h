//
//  LTThemeManager.h
//  LazyThemeDemo
//
//  Created by Hanran Liu on 2016/9/20.
//  Copyright © 2016年 rannie. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LTTheme;
@interface LTThemeManager : NSObject

@property (nonatomic, strong, readonly) NSDictionary<NSString *, LTTheme *> *themeMap;
@property (nonatomic, strong, readonly) LTTheme *currentTheme;

+ (instancetype)sharedManager;

- (void)setupThemes:(NSArray<LTTheme *> *)themes;
- (void)applyTheme:(LTTheme *)theme;

@end
