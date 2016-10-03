//
//  UIApplication+LazyTheme.m
//  LazyThemeDemo
//
//  Created by Hanran Liu on 2016/9/20.
//  Copyright © 2016年 rannie. All rights reserved.
//

#import "UIApplication+LazyTheme.h"
#import <objc/runtime.h>

static void * kCurrentVisibleViewControllerKey = &kCurrentVisibleViewControllerKey;

@implementation UIApplication (LazyTheme)

- (void)setCurrentVisibleViewController:(UIViewController *)currentVisibleViewController {
    objc_setAssociatedObject(self, kCurrentVisibleViewControllerKey, currentVisibleViewController, OBJC_ASSOCIATION_ASSIGN);
}

- (UIViewController *)currentVisibleViewController {
    return objc_getAssociatedObject(self, kCurrentVisibleViewControllerKey);
}

@end
