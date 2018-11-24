//
//  ITTableViewController.m
//  好友列表
//
//  Created by jyz on 2018/11/17.
//

#import "ITTableViewController.h"
#import "ITGroup.h"
#import "ITFriends.h"
#import "ITTableViewCell.h"
#import "ITHeaderFooterView.h"
@interface ITTableViewController () <ITHeaderFooterViewDelegate>
@property (nonatomic, strong) NSArray *groupArr;
@end

@implementation ITTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

// MARK: - Models Lazy Loading
- (NSArray *)groupArr {
    if (_groupArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@".plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *modelArr = [NSMutableArray array];
        for (NSDictionary *dictionary in arr) {
            ITGroup *model = [ITGroup groupWithDict:dictionary];
            [modelArr addObject:model];
        }
        _groupArr = modelArr;
    }
    return _groupArr;
}

// MARK: - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groupArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ITGroup *group = self.groupArr[section];
    NSInteger rows = group.isVisible == YES ? group.friends.count : 0;
    return rows;
}

// MARK: - Table view delegate
- (ITTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ITGroup *group = self.groupArr[indexPath.section];
    ITFriends *friend = group.friends[indexPath.row];
    ITTableViewCell *cell = [ITTableViewCell cellWithTableView:tableView];
    cell.model = friend;
    return cell;
}
// 自定义 UITableView 的 headerView 。
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ITGroup *model = self.groupArr[section];
    ITHeaderFooterView *headerFooterView = [ITHeaderFooterView headerFooterViewWithTableView:tableView];
    headerFooterView.model = model;
    headerFooterView.delegate = self;
    // 通过 tag 值来确定哪部分是需要被展开或者被折叠，tag 值为哪一部分
    headerFooterView.tag = section;
    return headerFooterView;
}

- (void)reloadTheDataWithHeaderView:(nonnull ITHeaderFooterView *)headerView {
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:headerView.tag] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
