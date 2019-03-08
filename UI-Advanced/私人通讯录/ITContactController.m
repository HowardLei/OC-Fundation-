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
static NSString *const ID = @"cell";
// MARK: - 与试图有关的方法
- (void)viewDidLoad {
    [super viewDidLoad];
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
    NSLog(@"%lu", self.contacts.count);
    return self.contacts.count;
}
- (__kindof UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);
    ITContactCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    // Configure the cell...
    if (!cell) {
        cell = [[ITContactCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.model = self.contact;
    }
    return cell;
}

@end
