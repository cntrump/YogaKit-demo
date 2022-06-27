//
//  TableViewController.m
//  YogaKit-demo
//
//  Created by v on 2022/6/23.
//

#import "TableViewController.h"
#import "DemoCell.h"
#import "Demo1ViewController.h"
#import "Demo2ViewController.h"
#import "Demo3ViewController.h"
#import "Demo4ViewController.h"
#import "Demo5ViewController.h"
@import SwiftComponent;

@interface TableViewController () {
    NSArray<DemoModel *> *_items;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = NSLocalizedString(@"YogaKit Demo", nil);

    [self.tableView registerClass:DemoCell.class forCellReuseIdentifier:NSStringFromClass(DemoCell.class)];

    _items = @[
        [DemoModel modelWithTitle:NSLocalizedString(@"单个居中", nil) class:Demo1ViewController.class],
        [DemoModel modelWithTitle:NSLocalizedString(@"九宫格布局", nil) class:Demo2ViewController.class],
        [DemoModel modelWithTitle:NSLocalizedString(@"滚动视图", nil) class:Demo3ViewController.class],
        [DemoModel modelWithTitle:NSLocalizedString(@"模拟 Twitter 时间线卡片", nil) class:Demo4ViewController.class],
        [DemoModel modelWithTitle:NSLocalizedString(@"文字输入框", nil) class:Demo5ViewController.class],
        [DemoModel modelWithTitle:NSLocalizedString(@"九宫格 (Swift)", nil) class:Demo6ViewController.class]
    ];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DemoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(DemoCell.class)
                                                     forIndexPath:indexPath];

    [cell configureWithModel:_items[indexPath.row]];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    DemoModel *model = _items[indexPath.row];
    UIViewController *vc = [[model.viewControllerClass alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
