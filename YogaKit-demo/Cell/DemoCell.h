//
//  DemoCell.h
//  YogaKit-demo
//
//  Created by v on 2022/6/23.
//

#import <UIKit/UIKit.h>
#import "DemoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DemoCell : UITableViewCell

- (void)configureWithModel:(DemoModel *)model;

@end

NS_ASSUME_NONNULL_END
