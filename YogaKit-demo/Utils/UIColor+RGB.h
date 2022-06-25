//
//  UIColor+RGB.h
//  YogaKit-demo
//
//  Created by v on 2022/6/25.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (RGB)

+ (instancetype)colorWithHex:(NSUInteger)hex alpha:(CGFloat)alpha;

@end

static inline UIColor *RGB(NSUInteger hex) {
    return [UIColor colorWithHex:hex alpha:1];
}

static inline UIColor *RGBA(NSUInteger hex, CGFloat a) {
    return [UIColor colorWithHex:hex alpha:a];
}

NS_ASSUME_NONNULL_END
