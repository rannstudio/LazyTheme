//
//  LTDefs.h
//  LazyThemeDemo
//
//  Created by Hanran Liu on 2016/9/20.
//  Copyright © 2016年 rannie. All rights reserved.
//

#ifndef LTDefs_h
#define LTDefs_h

#define LTModuleName @"[LazyTheme]"

#ifdef DEBUG
#define LTLog(...) NSLog((@"%@ %@"), LTModuleName, [NSString stringWithFormat:__VA_ARGS__])
#else
#define LTLog(...)
#endif

#endif /* LTDefs_h */
