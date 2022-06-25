//
//  UIColor+RGB.m
//  YogaKit-demo
//
//  Created by v on 2022/6/25.
//

#import "UIColor+RGB.h"

@implementation UIColor (RGB)

+ (instancetype)colorWithHex:(NSUInteger)hex alpha:(CGFloat)alpha {
    CGFloat red = (hex & 0xff0000) >> 16;
    CGFloat green = (hex & 0xff00) >> 8;
    CGFloat blue = hex & 0xff;

    return [self colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
}

@end
