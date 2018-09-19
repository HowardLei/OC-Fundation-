#import "ViewController.h"
/*
 UITableView 中的方法总结
 1、- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
    设置 UITableView 中一共分为几个组，若不实现，则默认为 1 。
 2、- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
    设置 UITableView 中每个组有几条数据
 3、- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
    为每组的每行显示什么样的数据。统一整理到一个 UITableViewCell 对象当中。
 4、- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
    设置每个分组上边显示什么内容。
 5、- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;
    设置每个分组下边显示什么内容
 注意：如果4、5两个方法中没有实现任何一个，则在控制器中看不到分组的样式。
 */
@interface ViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
// MARK: 一共分几个组，默认为 1 个。
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
// MARK: 每个组里面有几条数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 根据不同的组，返回每组显示不同条数的数据
    // 如果 section 为 0 ，则是亚洲，亚洲中显示 3 个国家。
    // 如果 section 为 1 ，则是非洲，非洲显示
    if (!section) {
        return 3;
    } else if (section == 1) {
        return 2;
    } else {
        return 1;
    }
}
// MARK:为每组的每行显示什么样的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (!indexPath.section) {
        if (!indexPath.row) {
            cell.textLabel.text = @"中国";
        } else if (indexPath.row == 1) {
            cell.textLabel.text = @"鬼子";
        } else {
            cell.textLabel.text = @"阿三";
        }
    } else if (indexPath.section == 1) {
        if (!indexPath.row) {
            cell.textLabel.text = @"南非";
        } else {
            cell.textLabel.text = @"埃及";
        }
    } else {
        cell.textLabel.text = @"欧盟";
    }
    return cell;
}
// MARK: 设置每组上边的数据
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (!section) {
        return @"亚洲";
    } else if (section == 1) {
        return @"非洲";
    } else {
        return @"欧洲";
    }
}
// MARK: 设置每组下边的显示内容
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
//    if (!section) {
//        return @"亚细亚";
//    } else if (section == 1) {
//        return @"阿非利加";
//    } else {
//        return @"欧罗巴";
//    }
//}
@end
