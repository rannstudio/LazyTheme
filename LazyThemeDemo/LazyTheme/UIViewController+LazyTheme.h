//
//  UIViewController+LazyTheme.h
//  LazyThemeDemo
//
//  Created by Hanran Liu on 2016/9/20.
//  Copyright © 2016年 rannie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LTTheme; 
@interface UIViewController (LazyTheme)

@property (nonatomic, strong) LTTheme *lt_currentTheme;

- (void)lt_modifyTheme;

@end
