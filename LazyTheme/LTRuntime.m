//
//  LTRuntime.m
//  LazyThemeDemo
//
//  Created by QiXin on 2016/10/7.
//  Copyright © 2016年 rannie. All rights reserved.
//

#import "LTRuntime.h"

void lt_swizzleMethod(Class class, SEL origSel, SEL newSel) {
    Method oriMethod = class_getInstanceMethod(class, origSel);
    Method newMethod = class_getInstanceMethod(class, newSel);
    
    BOOL didAddMethod = class_addMethod(class, origSel, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    if (didAddMethod) {
        class_replaceMethod(class, newSel, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
    } else {
        method_exchangeImplementations(oriMethod, newMethod);
    }
}
