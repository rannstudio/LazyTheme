//
//  LTThemePannel.h
//  LazyThemeDemo
//
//  Created by QiXin on 2016/10/10.
//  Copyright © 2016年 rannie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTThemePannel : UIWindow

+ (instancetype)sharedPannel;

- (void)show;
- (void)dismiss;

@end
