#import "ViewController.h"
/*
 常见 UITableView 的属性
 1、rowHeight 行高。注意这个设置行高是将 UITableView 中的所有行高全部设置。如果想设置各个行高，需要使用 UITableView 中的代理方法 - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath 进行设置。
 2、separatorColor 分割线颜色
 3、separatorStyle 分割线风格
 4、tableHeaderView tableView 最上边的一排，当往下滚动的时候会消失
 5、tableFooterView tableView 最下边的一排，一般放加载更多按钮。
 */
/*
 常见 UITableViewCell 的属性
 1、imageView 单元格中有 imageView 对象
 2、textLabel 单元格中的文本框
 3、detailTextLabel 细节框中的文本设置。用来展示这行数据的详细信息
 4、accessoryType 附件类型。如果不设置，默认为 UITableViewCellAccessoryNone （即无控件，需要自定义控件）有一下几种类型
 { UITableViewCellAccessoryDisclosureIndicator （一般的小尖箭头）
 UITableViewCellAccessoryDetailDisclosureButton （UITableViewCellAccessoryDetailButton 和 UITableViewCellAccessoryDisclosureIndicator 的结合体）
 UITableViewCellAccessoryCheckmark （一个勾勾）
 UITableViewCellAccessoryDetailButton （一个圈中有'i'）
 5、accessoryView 附件视图。在这个 View 中可以添加任何控件
 6、backgroundColor 设置单元格背景色
 7、backgroundView 设置单元格的视图，一般用它添加任何控件
 8、selectBackgroundView 当某行被选中的时候的背景视图
 */
@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = @"123";
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!(indexPath.row % 2)) {
        return 20;
    } else {
        return 50;
    }
}
@end
