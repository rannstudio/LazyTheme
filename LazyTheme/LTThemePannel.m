//
//  LTThemePannel.m
//  LazyThemeDemo
//
//  Created by QiXin on 2016/10/10.
//  Copyright © 2016年 rannie. All rights reserved.
//

#import "LTThemePannel.h"
#import "LTThemeManager.h"

@interface LTThemePannel ()
@property (nonatomic, strong) UIView   *maskView;
@property (nonatomic, assign) CGPoint   startPoint;
@end

@implementation LTThemePannel

+ (instancetype)sharedPannel {
    static dispatch_once_t onceToken;
    static LTThemePannel *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] initPannel];
    });
    return instance;
}

- (instancetype)initPannel {
    self = [super initWithFrame:CGRectMake(20, 20, 44, 44)];
    if (self) {
        self.windowLevel = UIWindowLevelStatusBar - 1;
        self.backgroundColor = [UIColor clearColor];
        
        UIButton *showBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [showBtn setBackgroundColor:[UIColor orangeColor]];
        [showBtn setTitle:@"LT" forState:UIControlStateNormal];
        showBtn.frame = CGRectMake(0, 0, 50, 50);
        showBtn.layer.cornerRadius = 25;
        [showBtn addTarget:self action:@selector(onPannelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:showBtn];
        
        UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPanGestureRecognize:)];
        [self addGestureRecognizer:panGes];
    }
    return self;
}

- (void)show {
    self.hidden = NO;
    UIWindow *lastKeyWindow = [[UIApplication sharedApplication] keyWindow];
    [self makeKeyAndVisible];
    [lastKeyWindow makeKeyAndVisible];
}

- (void)dismiss {
    self.hidden = YES;
}

- (void)onPannelButtonClicked:(id)sender {
    LTTheme *theme = [LTThemeManager sharedManager].currentTheme;
    NSArray *themeKeys = [LTThemeManager sharedManager].themeMap.allKeys;
    NSInteger index = [themeKeys indexOfObject:theme.themeName];
    NSInteger count = themeKeys.count;
    NSInteger nextKeyIndex = (index == (count-1))?0:index+1;
    NSString *nextKey = themeKeys[nextKeyIndex];
    LTTheme *newTheme = [LTThemeManager sharedManager].themeMap[nextKey];
    [[LTThemeManager sharedManager] applyTheme:newTheme];
}

- (void)onPanGestureRecognize:(UIPanGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        _startPoint = [gesture locationInView:self];
    } if (gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint location = [gesture locationInView:self];
        CGFloat x = location.x - _startPoint.x;
        CGFloat y = location.y - _startPoint.y;
        CGRect frame = CGRectOffset(self.frame, x, y);
        self.frame = frame;
    }
}

@end
