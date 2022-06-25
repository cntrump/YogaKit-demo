//
//  DemoCell.m
//  YogaKit-demo
//
//  Created by v on 2022/6/23.
//

#import "DemoCell.h"
@import YogaKit;

@interface DemoCell () {
    UILabel *_titleLabel;
}

@end

@implementation DemoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.justifyContent = YGJustifyCenter;
        }];

        _titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.alignSelf = YGAlignFlexStart;
            layout.marginLeft = YGPointValue(16);
        }];
    }

    return self;
}

- (void)configureWithModel:(DemoModel *)model {
    _titleLabel.text = model.title;
    [_titleLabel.yoga markDirty];

    [self.contentView.yoga applyLayoutPreservingOrigin:YES];
}

@end
