//
//  LTRuntime.h
//  LazyThemeDemo
//
//  Created by QiXin on 2016/10/7.
//  Copyright © 2016年 rannie. All rights reserved.
//

#import <objc/runtime.h>

void lt_swizzleMethod(Class class, SEL origSel, SEL newSel);
