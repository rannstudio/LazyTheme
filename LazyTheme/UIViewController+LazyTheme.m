//
//  UIViewController+LazyTheme.m
//  LazyThemeDemo
//
//  Created by Hanran Liu on 2016/9/20.
//  Copyright © 2016年 rannie. All rights reserved.
//

#import "UIViewController+LazyTheme.h"
#import "LTTheme.h"
#import "LTThemeManager.h"
#import "UIView+LazyTheme.h"
#import "UIApplication+LazyTheme.h"
#import "LTDefs.h"
#import "LTRuntime.h"

static void * kLTCurrentThemeKey = &kLTCurrentThemeKey;

@implementation UIViewController (LazyTheme)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lt_swizzleMethod([self class], @selector(viewDidLoad),     @selector(lt_viewDidLoad));
        lt_swizzleMethod([self class], @selector(viewWillAppear:), @selector(lt_viewWillAppear:));
        lt_swizzleMethod([self class], @selector(viewDidAppear:),  @selector(lt_viewDidAppear:));
    });
}

- (void)lt_viewDidLoad {
    [self lt_viewDidLoad];
    self.lt_currentTheme = [LTThemeManager sharedManager].currentTheme;
}

- (void)lt_viewWillAppear:(BOOL)animated {
    [self lt_viewWillAppear:animated];
    [self lt_modifyTheme];
}

- (void)lt_viewDidAppear:(BOOL)animated {
    [self lt_viewDidAppear:animated];
    [[UIApplication sharedApplication] setCurrentVisibleViewController:self];
}

- (void)setLt_currentTheme:(LTTheme *)lt_currentTheme {
    objc_setAssociatedObject(self, kLTCurrentThemeKey, lt_currentTheme, OBJC_ASSOCIATION_RETAIN);
}

- (LTTheme *)lt_currentTheme {
    return objc_getAssociatedObject(self, kLTCurrentThemeKey);
}

- (void)lt_modifyTheme {
    LTTheme *currentTheme = [LTThemeManager sharedManager].currentTheme;
    if (self.lt_currentTheme == currentTheme) {
        return;
    }
    
    if (self.parentViewController) {
        [self.parentViewController lt_modifyTheme];
        self.lt_currentTheme = currentTheme;
        return;
    }
    
    UIView *modView = self.view;
    
    [self lt_enumerateSubviews:modView usingBlock:^(UIView *subview) {
        if (subview.isLazyThemeComponent) {
            [subview lt_refreshThemeDisplay];
        }
    }];
    
    if (self.navigationController) [self.navigationController lt_modifyTheme];
    if (self.tabBarController) [self.tabBarController lt_modifyTheme];
    
    self.lt_currentTheme = currentTheme;
}

// Include root view
- (void)lt_enumerateSubviews:(UIView *)rootView usingBlock:(void (^)(UIView *subview))block {
    if (!block) {
        return;
    }
    block(rootView);
    
    NSArray *subviews = rootView.subviews;
    if (!subviews || subviews.count == 0) {
        return;
    }
    
    for (UIView *subview in subviews) {
        block(subview);
        [self lt_enumerateSubviews:subview usingBlock:block];
    }
}

@end
