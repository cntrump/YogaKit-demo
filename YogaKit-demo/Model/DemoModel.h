//
//  DemoModel.h
//  YogaKit-demo
//
//  Created by v on 2022/6/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DemoModel : NSObject

@property(nonatomic, copy, readonly) NSString *title;

@property(nonatomic, readonly) Class viewControllerClass;

+ (instancetype)modelWithTitle:(NSString *)title class:(Class)vcClass;

@end

NS_ASSUME_NONNULL_END
