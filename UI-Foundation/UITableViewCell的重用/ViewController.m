#import "ViewController.h"
#import "ITHero.h"
/*
 为什么要对 UITableView 中的 Cell 进行重用？
    因为创建 cell 的时候，
 */
@interface ViewController () <UITableViewDataSource>
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

- (void)viewDidLoad {
    [super viewDidLoad];
}


@end
