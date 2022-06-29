//
//  Demo5ViewController.m
//  YogaKit-demo
//
//  Created by v on 2022/6/25.
//

#import "Demo5ViewController.h"
#import "SafeAreaView.h"

@interface Demo5ViewController () {
    SafeAreaView *_contentView;
    UITextView *_inputView;
    UIToolbar *_toolbar;
    BOOL _isKeyboardObserved;
}

@end

@implementation Demo5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _contentView = [[SafeAreaView alloc] init];
    [self.view addSubview:_contentView];
    [_contentView.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.flexGrow = 1;
    }];

    _inputView = [[UITextView alloc] init];
    _inputView.textContainerInset = UIEdgeInsetsMake(24, 16, 24, 16);
    [_contentView addSubview:_inputView];
    [_inputView.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.flexGrow = 1;
    }];

    _toolbar = [[UIToolbar alloc] init];
    [_contentView addSubview:_toolbar];
    [_toolbar.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.height = YGPointValue(44);
    }];

    [_inputView becomeFirstResponder];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self addKeyboardObserver];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [self removeKeyboardObserver];
}

- (void)addKeyboardObserver {
    if (_isKeyboardObserved) {
        return;
    }

    _isKeyboardObserved = YES;

    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(handleKeyboardWillChangeFrameNotification:)
                                               name:UIKeyboardWillChangeFrameNotification
                                             object:nil];
}

- (void)removeKeyboardObserver {
    if (!_isKeyboardObserved) {
        return;
    }

    _isKeyboardObserved = NO;

    [NSNotificationCenter.defaultCenter removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)handleKeyboardWillChangeFrameNotification:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    CGRect frameEnd = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    UIViewAnimationCurve curve = (UIViewAnimationCurve)[userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    NSTimeInterval duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];

    CGFloat paddingBottom = CGRectGetHeight(self.view.bounds) - CGRectGetMinY(frameEnd);

    [self.view.yoga configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.paddingBottom = YGPointValue(paddingBottom);
    }];

    [UIView animateWithDuration:duration delay:0 options:(UIViewAnimationOptions)(curve << 16) animations:^{
        [self.view.yoga applyLayoutPreservingOrigin:YES];
    } completion:^(BOOL finished) {
    }];
}

@end
