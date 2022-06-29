//
//  DemoModel.m
//  YogaKit-demo
//
//  Created by v on 2022/6/24.
//

#import "DemoModel.h"

@implementation DemoModel

+ (instancetype)modelWithTitle:(NSString *)title class:(Class)vcClass {
    return [[self alloc] initWithTitle:title class:vcClass];
}

- (instancetype)initWithTitle:(NSString *)title class:(Class)vcClass {
    if (self = [super init]) {
        _title = [title copy];
        _viewControllerClass = vcClass;
    }

    return self;
}

@end
