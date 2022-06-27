//
//  Demo1ViewController.m
//  YogaKit-demo
//
//  Created by v on 2022/6/24.
//

#import "Demo1ViewController.h"

@interface Demo1ViewController ()

@end

@implementation Demo1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.alignItems = YGAlignCenter;
        layout.justifyContent = YGJustifyCenter;
    }];

    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = UIColor.orangeColor;
    [self.view addSubview:view1];
    [view1.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.size = CGSizeMake(160, 160);
    }];
}

@end
