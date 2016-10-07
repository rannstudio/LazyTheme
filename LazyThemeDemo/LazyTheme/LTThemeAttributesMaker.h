//
//  LTThemeAttributesMaker.h
//  LazyThemeDemo
//
//  Created by Hanran Liu on 2016/9/29.
//  Copyright © 2016年 rannie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LTThemeAttributesMaker : NSObject

@property (nonatomic, weak, readonly) UIView *view;
// Normal
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *tintColor;
// Label
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont  *font;
// Button
@property (nonatomic, strong) UIColor *titleNormalColor;
@property (nonatomic, strong) UIColor *titleHightlightColor;
@property (nonatomic, strong) UIColor *titleDisableColor;
@property (nonatomic, strong) UIColor *titleSelectColor;
@property (nonatomic, strong) UIFont  *titleFont;
// Navi Bar
@property (nonatomic, strong) UIColor *barTintColor;

- (instancetype)initWithView:(UIView *)view;

- (void)install;

@end
