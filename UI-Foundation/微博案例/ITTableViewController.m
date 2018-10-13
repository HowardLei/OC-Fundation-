#import "ITTableViewController.h"
#import "ITWeibo.h"
#import "ITTableViewCell.h"

@interface ITTableViewController ()
@property (nonatomic, strong) NSArray *weiboArr;
@end

@implementation ITTableViewController
// MARK:懒加载微博数据
- (NSArray *)weiboArr {
    if (_weiboArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"weibo" ofType:@".plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *modelArr = [NSMutableArray array];
        for (NSDictionary *dictionary in arr) {
            ITWeibo *model = [ITWeibo weiboWithDict:dictionary];
            [modelArr addObject:model];
        }
        _weiboArr = modelArr;
    }
    return _weiboArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 250;
}
#pragma mark - Table view data source
//MARK: 设置单元格行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weiboArr.count;
}
// MARK: 设置单元格
- (ITTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1、获取模型数据
    ITWeibo *model = self.weiboArr[indexPath.row];
    // 2、创建单元格
    static NSString *ID = @"weibo";
    ITTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ITTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    // 3、设置单元格数据
    cell.model = model;
    // 4、返回单元格
    return cell;
}
@end
