//
//  ViewController.m
//  LazyThemeDemo
//
//  Created by Hanran Liu on 2016/9/20.
//  Copyright © 2016年 rannie. All rights reserved.
//

#import "HomeViewController.h"
#import "DetailViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Home";
    
    [self.view lt_makeThemeAttributes:^(LTTheme *theme, LTThemeAttributesMaker *maker) {
        maker.backgroundColor = COLOR_WITH_HEX(theme.globalBackgroundColor);
    }];
    
    CGPoint center = self.view.center;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    label.text = @"I'm a label";
    label.textAlignment = NSTextAlignmentCenter;
    label.center = CGPointMake(center.x, center.y - 40);
    [label lt_makeThemeAttributes:^(LTTheme *theme, LTThemeAttributesMaker *maker) {
        maker.textColor = COLOR_WITH_HEX(theme.globalThemeColor);
    }];
    [self.view addSubview:label];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 200, 42);
    button.center = CGPointMake(center.x, center.y + 40);
    [button setTitle:@"I'm a button" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onPushBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [button lt_makeThemeAttributes:^(LTTheme *theme, LTThemeAttributesMaker *maker) {
        maker.backgroundColor = COLOR_WITH_HEX(theme.globalThemeColor);
    }];
    [self.view addSubview:button];
}

- (void)onPushBtnClicked:(id)sender {
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
