//
//  UIView+LazyTheme.h
//  LazyThemeDemo
//
//  Created by Hanran Liu on 2016/9/20.
//  Copyright © 2016年 rannie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTTheme.h"
#import "LTThemeAttributesMaker.h"

typedef void (^LTConfigThemeBlock)(LTTheme *theme);
typedef void (^LTThemeAttributesMakeBlock)(LTTheme *theme, LTThemeAttributesMaker *maker);

@interface UIView (LazyTheme)

@property (nonatomic, assign) BOOL isLazyThemeComponent;

- (void)lt_makeThemeAttributes:(LTThemeAttributesMakeBlock)makeBlock;
- (void)lt_refreshThemeDisplay;

@end
