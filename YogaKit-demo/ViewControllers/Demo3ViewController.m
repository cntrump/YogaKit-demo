//
//  Demo3ViewController.m
//  YogaKit-demo
//
//  Created by v on 2022/6/24.
//

#import "Demo3ViewController.h"

@interface Demo3ViewController () {
    NSArray<NSString *> *_paragraphItems;
}

@end

@implementation Demo3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = NSLocalizedString(@"React Native", nil);

    [self makeParagraphItems];

    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView];
    [scrollView.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.height = YGPercentValue(100);
    }];

    UIView *contentView = [[UIView alloc] init];
    [scrollView addSubview:contentView];
    contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [contentView.topAnchor constraintEqualToAnchor:scrollView.topAnchor],
        [contentView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor],
        [contentView.bottomAnchor constraintEqualToAnchor:scrollView.bottomAnchor],
        [contentView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor]
    ]];

    [contentView.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.paddings = UIEdgeInsetsMake(24 - 16, 16, 24, 16);
    }];

    for (NSString *text in _paragraphItems) {
        UILabel *textLabel = [[UILabel alloc] init];
        textLabel.numberOfLines = 0;
        textLabel.text = text;
        [contentView addSubview:textLabel];
        [textLabel.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.marginTop = YGPointValue(16);
            layout.flexShrink = 1;
        }];
    }
}

- (void)makeParagraphItems {
    _paragraphItems = @[
        @"Create native apps for Android and iOS using React",
        @"React Native combines the best parts of native development with React, a best-in-class JavaScript library for building user interfaces.",
        @"Use a little—or a lot. You can use React Native today in your existing Android and iOS projects or you can create a whole new app from scratch.",
        @"Written in JavaScript—rendered with native code",
        @"React primitives render to native platform UI, meaning your app uses the same native platform APIs other apps do.",
        @"Many platforms, one React. Create platform-specific versions of components so a single codebase can share code across platforms. With React Native, one team can maintain two platforms and share a common technology—React.",
        @"Native Development For Everyone",
        @"React Native lets you create truly native apps and doesn't compromise your users' experiences. It provides a core set of platform agnostic native components like View, Text, and Image that map directly to the platform’s native UI building blocks.",
        @"Seamless Cross-Platform",
        @"React components wrap existing native code and interact with native APIs via React’s declarative UI paradigm and JavaScript. This enables native app development for whole new teams of developers, and can let existing native teams work much faster.",
        @"Fast Refresh",
        @"See your changes as soon as you save. With the power of JavaScript, React Native lets you iterate at lightning speed. No more waiting for native builds to finish. Save, see, repeat.",
        @"Talks and Videos",
        @"Members of the React Native team frequently speak at various conferences.",
        @"You can follow the latest news from the React Native team on Twitter @reactnative",
        @"The Meta Open Source team has put together a short overview of React Native, where they explained the project in beginner's terms.",
        @"Facebook Supported, Community Driven",
        @"Facebook released React Native in 2015 and has been maintaining it ever since.",
        @"In 2018, React Native had the 2nd highest number of contributors for any repository in GitHub. Today, React Native is supported by contributions from individuals and companies around the world including Callstack, Expo, Infinite Red, Microsoft and Software Mansion.",
        @"Our community is always shipping exciting new projects and exploring platforms beyond Android and iOS with repos like React Native Windows, React Native macOS and React Native Web."
    ];
}

@end
