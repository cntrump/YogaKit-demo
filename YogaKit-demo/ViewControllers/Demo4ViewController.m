//
//  Demo4ViewController.m
//  YogaKit-demo
//
//  Created by v on 2022/6/25.
//

#import "Demo4ViewController.h"
#import "UIColor+RGB.h"

@interface Demo4ViewController ()

@end

@implementation Demo4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = RGB(0x16181c);

    [self.view.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.justifyContent = YGJustifyCenter;
    }];

    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = UIColor.blackColor;
    [self.view addSubview:view1];
    [view1.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.marginLeft = YGPointValue(16);
        layout.marginRight = YGPointValue(16);
        layout.paddingLeft = YGPointValue(16);
        layout.paddingRight = YGPointValue(16);
        layout.maxWidth = YGPointValue(414);
    }];

    UIView *headerView = [[UIView alloc] init];
    [view1 addSubview:headerView];
    [headerView.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.flexDirection = YGFlexDirectionRow;
        layout.marginTop = YGPointValue(16);
    }];

    UIImageView *avatarView = [[UIImageView alloc] init];
    avatarView.layer.cornerRadius = 24;
    avatarView.clipsToBounds = YES;
    avatarView.contentMode = UIViewContentModeScaleAspectFill;
    avatarView.backgroundColor = RGB(0xe55e44);
    [headerView addSubview:avatarView];
    [avatarView.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.size = CGSizeMake(48, 48);
    }];

    UIView *nameContainer = [[UIView alloc] init];
    [headerView addSubview:nameContainer];
    [nameContainer.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.alignSelf = YGAlignCenter;
        layout.flexGrow = 1;
        layout.flexShrink = 1;
        layout.marginLeft = YGPointValue(12);
    }];

    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont boldSystemFontOfSize:15];
    nameLabel.textColor = RGB(0xe7e9ea);
    nameLabel.text = @"Swift Language";
    [nameContainer addSubview:nameLabel];
    [nameLabel.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.alignSelf = YGAlignFlexStart;
        layout.flexShrink = 1;
    }];

    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.font = [UIFont systemFontOfSize:15];
    timeLabel.textColor = RGB(0x71767b);
    timeLabel.text = @"@SwiftLang · 2021年4月27日";
    [nameContainer addSubview:timeLabel];
    [timeLabel.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.alignSelf = YGAlignFlexStart;
    }];

    UIImageView *moreView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"twitter_more_item"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    moreView.tintColor = RGB(0x71767b);
    [headerView addSubview:moreView];
    [moreView.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.size = CGSizeMake(19, 19);
    }];

    UIView *bodyView = [[UIView alloc] init];
    [view1 addSubview:bodyView];
    [bodyView.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.marginTop = YGPointValue(12);
    }];

    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.font = [UIFont systemFontOfSize:15];
    textLabel.textColor = RGB(0xe7e9ea);
    textLabel.numberOfLines = 0;
    textLabel.text = @"Swift 5.4 is now released!  It includes new language features as well as tooling improvements.  Read more about it here: swift.org/blog/swift-5-4…";
    [bodyView addSubview:textLabel];
    [textLabel.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.alignSelf = YGAlignFlexStart;
    }];

    UIView *footerView = [[UIView alloc] init];
    [view1 addSubview:footerView];
    [footerView.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.flexDirection = YGFlexDirectionRow;
        layout.justifyContent = YGJustifySpaceBetween;
        layout.marginTop = YGPointValue(12);
        layout.marginBottom = YGPointValue(12);
    }];

    UIView *(^makeItem)(UIImage *, NSInteger) = ^UIView * (UIImage *image, NSInteger count) {
        UIView *itemView = [[UIView alloc] init];
        [itemView.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.alignItems = YGAlignCenter;
        }];

        UIImageView *iconView = [[UIImageView alloc] initWithImage:image];
        [itemView addSubview:iconView];
        [iconView.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.size = CGSizeMake(19, 19);
        }];

        if (count > 0) {
            UILabel *countLabel = [[UILabel alloc] init];
            countLabel.font = [UIFont systemFontOfSize:13];
            countLabel.textColor = RGB(0x71767b);
            countLabel.text = [NSString stringWithFormat:@"%ld", count];
            [itemView addSubview:countLabel];
            [countLabel.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
                layout.marginLeft = YGPointValue(12);
                layout.marginRight = YGPointValue(12);
            }];
        }
        return itemView;
    };

    UIView *commentView = makeItem([UIImage imageNamed:@"twitter_comment_item"], 1);
    [footerView addSubview:commentView];
    [commentView.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.flexDirection = YGFlexDirectionRow;
    }];

    UIView *forwardView = makeItem([UIImage imageNamed:@"twitter_forward_item"], 12);
    [footerView addSubview:forwardView];
    [forwardView.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.flexDirection = YGFlexDirectionRow;
    }];

    UIView *likeView = makeItem([UIImage imageNamed:@"twitter_like_item"], 141);
    [footerView addSubview:likeView];
    [likeView.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.flexDirection = YGFlexDirectionRow;
    }];

    UIView *shareView = makeItem([UIImage imageNamed:@"twitter_share_item"], 0);
    [footerView addSubview:shareView];
    [shareView.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.flexDirection = YGFlexDirectionRow;
    }];
}

@end
