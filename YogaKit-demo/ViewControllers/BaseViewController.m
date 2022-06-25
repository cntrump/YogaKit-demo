//
//  BaseViewController.m
//  YogaKit-demo
//
//  Created by v on 2022/6/24.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = UIColor.whiteColor;

    [self.view.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.flexDirection = YGFlexDirectionColumn;
    }];
}

@end
