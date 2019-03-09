//
//  ITContactController.m
//  私人通讯录
//
//  Created by 雷维卡 on 2019/3/7.
//

#import "ITContactController.h"
#import "ITContactCell.h"

@interface ITContactController ()
@property (nonatomic, strong) NSMutableArray<ITContact *> *contacts;
@end

@implementation ITContactController
static NSString *const ID = @"ContactCell";
- (NSMutableArray<ITContact *> *)contacts {
    if (!_contacts) {
        _contacts = [NSMutableArray array];
    }
    if (_contact != nil) {
        // FIXME: 再添加的时候，会将第二个添加进去
        [_contacts addObject:_contact];
    }
    return _contacts;
}
// MARK: - 与视图有关的方法
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 80;
}
// MARK: - 按钮业务
- (IBAction)logout:(id)sender {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"退出登录" message:@"请问您是否注销？" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *logoutAction = [UIAlertAction actionWithTitle:@"注销" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [controller addAction:logoutAction];
    [controller addAction:cancelAction];
    [self presentViewController:controller animated:YES completion:nil];
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}
- (__kindof UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ITContactCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.model = self.contacts[indexPath.row];
    return cell;
}

@end
