//
//  ITContactController.m
//  私人通讯录
//
//  Created by 雷维卡 on 2019/3/7.
//

#import "ITContactController.h"
#import "ITContactCell.h"
#import "ITEditController.h"
@interface ITContactController () <ITEditControllerDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addContactButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *logoutButton;
@property (nonatomic, strong) NSIndexPath *selectedCellIndexPath;
@end

@implementation ITContactController
// MARK: - 懒加载联系人
- (NSMutableArray<ITContact *> *)contacts {
    if (!_contacts) {
        _contacts = [NSMutableArray array];
    }
    return _contacts;
}
// MARK: - 与视图有关的方法
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 75;
}
// MARK: - 与 segue 有关的方法
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // 根据 segue 的识别符判断具体是哪条 segue
    if ([segue.identifier isEqualToString:@"editContact"]) {
        // 1. 获得联系人
        ITContact *contact = self.contacts[self.selectedCellIndexPath.row];
        // 2. 将联系人当中的数据传到控制器当中
        ITEditController *editVC = segue.destinationViewController;
        editVC.contact = contact;
        editVC.delegate = self;
    }
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
- (IBAction)editCell:(UIBarButtonItem *)sender {
    self.addContactButton.enabled = !self.addContactButton.isEnabled;
    self.logoutButton.enabled = !self.logoutButton.isEnabled;
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
}
// MARK: - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}
- (__kindof UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *const ID = @"ContactCell";
    ITContactCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.model = self.contacts[indexPath.row];
    return cell;
}
// MARK: - Table view delegate
/**
 设置 table view 需要添加 cell 或者删除 cell 的时候进行如下处理
 @param tableView 拖动 cell 所在的 table view
 @param editingStyle 编辑样式
 @param indexPath cell 所在的位置
 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (editingStyle) {
        case UITableViewCellEditingStyleDelete:
            // 1. 将数组当中的数据删除
            [self.contacts removeObjectAtIndex:indexPath.row];
            // 2. 将 cell 当中的数据同样删除了
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case UITableViewCellEditingStyleInsert:
            break;
        default:
            break;
    }
}
/**
 当需要改变每一行的编辑
 @param tableView 需要改变的 table view
 @param indexPath 需要改变 table view cell 的位置
 @return table view cell 的编辑样式
 */
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row % 2 ? UITableViewCellEditingStyleInsert: UITableViewCellEditingStyleDelete;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedCellIndexPath = indexPath;
}
// MARK: - ITEditController delegate
- (void)editCellContent:(ITContact *)contact {
    self.contacts[self.selectedCellIndexPath.row] = contact;
    [self.tableView reloadRowsAtIndexPaths:@[self.selectedCellIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
@end
