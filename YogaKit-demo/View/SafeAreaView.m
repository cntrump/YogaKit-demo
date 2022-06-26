//
//  SafeAreaView.m
//  YogaKit-demo
//
//  Created by v on 2022/6/26.
//

#import "SafeAreaView.h"
@import YogaKit;

@implementation SafeAreaView

// Called by -[UIView(Geometry) setFrame:]
- (void)safeAreaInsetsDidChange API_AVAILABLE(ios(11.0),tvos(11.0)) {
    [super safeAreaInsetsDidChange];

    UIEdgeInsets safeAreaInsets = self.safeAreaInsets;
    __weak typeof(self) wself = self;

    dispatch_async(dispatch_get_main_queue(), ^{
        typeof(self) self = wself;
        if (!self) {
            return;
        }

        [self.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.paddingTop = YGPointValue(safeAreaInsets.top);
            layout.paddingLeft = YGPointValue(safeAreaInsets.left);
            layout.paddingBottom = YGPointValue(safeAreaInsets.bottom);
            layout.paddingRight = YGPointValue(safeAreaInsets.right);
        }];
        [self.yoga applyLayoutPreservingOrigin:YES];
    });
}

@end
