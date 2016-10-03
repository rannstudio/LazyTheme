//
//  LTThemeAttributesMaker.m
//  LazyThemeDemo
//
//  Created by Hanran Liu on 2016/9/29.
//  Copyright © 2016年 rannie. All rights reserved.
//

#import "LTThemeAttributesMaker.h"

@implementation LTThemeAttributesMaker

- (instancetype)initWithView:(UIView *)view {
    self = [super init];
    if (self) {
        _view = view;
    }
    return self;
}

- (void)install {
    UIView *themeView = self.view;
    if (self.backgroundColor) {
        themeView.backgroundColor = self.backgroundColor;
    }
    if (self.tintColor) {
        themeView.tintColor = self.tintColor;
    }
    
    if ([themeView isKindOfClass:[UILabel class]])
    {
        UILabel *label = (UILabel *)themeView;
        if (self.textColor) {
            label.textColor = self.textColor;
        }
        if (self.font) {
            label.font = self.font;
        }
    }
    else if ([themeView isKindOfClass:[UIButton class]])
    {
        UIButton *button = (UIButton *)themeView;
        if (self.titleFont) {
            button.titleLabel.font = self.titleFont;
        }
        if (self.titleNormalColor) {
            [button setTitleColor:self.titleNormalColor forState:UIControlStateNormal];
        }
        if (self.titleHightlightColor) {
            [button setTitleColor:self.titleHightlightColor forState:UIControlStateHighlighted];
        }
        if (self.titleDisableColor) {
            [button setTitleColor:self.titleDisableColor forState:UIControlStateDisabled];
        }
        if (self.titleSelectColor) {
            [button setTitleColor:self.titleSelectColor forState:UIControlStateSelected];
        }
    }
}

@end
