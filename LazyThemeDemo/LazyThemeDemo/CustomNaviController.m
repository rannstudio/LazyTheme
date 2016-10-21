//
//  CustomNaviController.m
//  LazyThemeDemo
//
//  Created by QiXin on 2016/10/21.
//  Copyright © 2016年 rannie. All rights reserved.
//

#import "CustomNaviController.h"

@interface CustomNaviController ()

@end

@implementation CustomNaviController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar lt_makeThemeAttributes:^(LTTheme *theme, LTThemeAttributesMaker *maker) {
        maker.barTintColor = COLOR_WITH_HEX(theme.globalThemeColor);
        maker.tintColor = COLOR_WITH_HEX(theme.globalBackgroundColor);
        maker.barTitleAttributes = @{NSForegroundColorAttributeName:COLOR_WITH_HEX(theme.globalBackgroundColor)};
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
