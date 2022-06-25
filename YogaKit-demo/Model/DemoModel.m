//
//  DemoModel.m
//  YogaKit-demo
//
//  Created by v on 2022/6/24.
//

#import "DemoModel.h"

@implementation DemoModel

+ (instancetype)modelWithTitle:(NSString *)title class:(Class)class {
    return [[self alloc] initWithTitle:title class:class];
}

- (instancetype)initWithTitle:(NSString *)title class:(Class)class {
    if (self = [super init]) {
        _title = [title copy];
        _viewControllerClass = class;
    }

    return self;
}

@end
