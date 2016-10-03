//
//  Macro.h
//  LazyThemeDemo
//
//  Created by Hanran Liu on 2016/9/23.
//  Copyright © 2016年 rannie. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

#define COLOR_WITH_HEX(hexValue)  [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]

#endif /* Macro_h */
