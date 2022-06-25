//
//  Demo2ViewController.m
//  YogaKit-demo
//
//  Created by v on 2022/6/24.
//

#import "Demo2ViewController.h"

@interface Demo2ViewController ()

@end

@implementation Demo2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.alignItems = YGAlignCenter;
        layout.justifyContent = YGJustifyCenter;
    }];

    CGFloat s = 80, spacing = 3;

    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = UIColor.lightGrayColor;
    [self.view addSubview:view1];
    [view1.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.flexDirection = YGFlexDirectionRow;
        layout.flexWrap = YGWrapWrap;
        layout.paddingTop = YGPointValue(-spacing);
        layout.paddingLeft = YGPointValue(-spacing);
        layout.width = YGPointValue(s * 3 + spacing * 2);
        layout.height = YGPointValue(s * 3 + spacing * 2);
    }];

    for (NSInteger i = 0; i < 9; ++i) {
        UIView *cell = [[UIView alloc] init];
        cell.backgroundColor = UIColor.orangeColor;
        cell.layer.borderWidth = 1;
        cell.layer.borderColor = UIColor.grayColor.CGColor;
        [view1 addSubview:cell];
        [cell.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.marginTop = YGPointValue(spacing);
            layout.marginLeft = YGPointValue(spacing);
            layout.width = YGPointValue(s);
            layout.height = YGPointValue(s);
        }];
    }
}

@end
