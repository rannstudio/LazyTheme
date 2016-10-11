//
//  DetailViewController.m
//  LazyThemeDemo
//
//  Created by QiXin on 2016/10/10.
//  Copyright © 2016年 rannie. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view lt_makeThemeAttributes:^(LTTheme *theme, LTThemeAttributesMaker *maker) {
        maker.backgroundColor = COLOR_WITH_HEX(theme.globalThemeColor);
    }];
}

@end
