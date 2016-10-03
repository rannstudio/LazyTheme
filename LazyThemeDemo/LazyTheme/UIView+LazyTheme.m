//
//  UIView+LazyTheme.m
//  LazyThemeDemo
//
//  Created by Hanran Liu on 2016/9/20.
//  Copyright © 2016年 rannie. All rights reserved.
//

#import "UIView+LazyTheme.h"
#import "LTThemeManager.h"
#import <objc/runtime.h>

static void * kLazyThemeFlagKey      = &kLazyThemeFlagKey;
static void * kLazyThemeMakeBlockKey = &kLazyThemeMakeBlockKey;

@interface UIView (LazyThemeInternal)
@property (nonatomic, copy) LTThemeAttributesMakeBlock makeThemeBlock;
@end

@implementation UIView (LazyTheme)

- (void)setIsLazyThemeComponent:(BOOL)isLazyThemeComponent {
    objc_setAssociatedObject(self, kLazyThemeFlagKey, @(isLazyThemeComponent), OBJC_ASSOCIATION_RETAIN);
}

- (BOOL)isLazyThemeComponent {
    id value = objc_getAssociatedObject(self, kLazyThemeFlagKey);
    if (!value) {
        [self setIsLazyThemeComponent:NO];
        return NO;
    }
    return [value boolValue];
}

- (void)setMakeThemeBlock:(LTThemeAttributesMakeBlock)makeThemeBlock {
    objc_setAssociatedObject(self, kLazyThemeMakeBlockKey, makeThemeBlock, OBJC_ASSOCIATION_COPY);
}

- (LTThemeAttributesMakeBlock)makeThemeBlock {
    return objc_getAssociatedObject(self, kLazyThemeMakeBlockKey);
}

- (void)lt_makeThemeAttributes:(LTThemeAttributesMakeBlock)makeBlock {
    if (makeBlock) {
        LTThemeAttributesMaker *maker = [[LTThemeAttributesMaker alloc] initWithView:self];
        makeBlock([LTThemeManager sharedManager].currentTheme, maker);
        [maker install];
        self.makeThemeBlock = makeBlock;
        self.isLazyThemeComponent = YES;
    }
}

- (void)lt_refreshThemeDisplay {
    if (self.makeThemeBlock) {
        LTThemeAttributesMaker *maker = [[LTThemeAttributesMaker alloc] initWithView:self];
        self.makeThemeBlock([LTThemeManager sharedManager].currentTheme, maker);
        [maker install];
    }
}

@end
