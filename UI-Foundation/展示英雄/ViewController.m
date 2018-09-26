#import "ViewController.h"
#import "ITHero.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *arr;
@property (weak, nonatomic) IBOutlet UITableView *heroesTableView;
@end

@implementation ViewController
// MARK: 懒加载数据
- (NSArray *)arr {
    if (_arr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heroes" ofType:@".plist"];
        NSArray *heroesArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *modelArr = [NSMutableArray array];
        for (NSDictionary *dict in heroesArr) {
            ITHero *model = [ITHero heroWithDict:dict];
            [modelArr addObject:model];
        }
        _arr = modelArr;
    }
    return _arr;
}
// MARK: 设置 UITableView 中的每行数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}
// MARK: 对每行数据进行设置
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1、导入数据
    ITHero *model = self.arr[indexPath.row];
    // 2、创建对象
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    // 2、为对象设置数据
    cell.imageView.image = [UIImage imageNamed:model.icon];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.intro;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // 3、返回设置好的对象
    return cell;
}
// 监听点击按钮的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1、将模型导入到方法当中
    ITHero *model = self.arr[indexPath.row];
    // 2、创建通知
    // 2.1 设置通知控制器
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"编辑英雄" message:nil preferredStyle:UIAlertControllerStyleAlert];
    // 2.2 设置通知行为
    UIAlertAction *editAction = [UIAlertAction actionWithTitle:@"编辑" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 获取文本框，注意：每个行为的方法可能有多个文本框，先获得才能操作。
        UITextField *textField = controller.textFields.firstObject;
        model.name = textField.text;
        // 记住：修改完文本以后，记住刷新整个数据
        [self.heroesTableView reloadData];
    }];
    // 设置文本框的内容（注意：这个块里面的代码相当与文本框创建完以后就执行完）
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = model.name;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }];
    // 2.3 添加事件
    [controller addAction:editAction];
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
