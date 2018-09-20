#import "ViewController.h"
#import "ITGroup.h"
@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *carTableView;
@property (nonatomic,strong) NSArray *carArr;
@end

@implementation ViewController
// MARK: 懒加载数据
- (NSArray *)carArr {
    if (_carArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_simple" ofType:@".plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *modelArr = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            ITGroup *model = [ITGroup groupWithDict:dict];
            [modelArr addObject:model];
        }
        _carArr = modelArr;
    }
    return _carArr;
}
// MARK: 设置 carTableView 的分组数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.carArr.count;
}
// MARK:设置每个组中有几个元素
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ITGroup *model = self.carArr[section];
    return model.cars.count;
}
// MARK: 设置每个组中的每行显示内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1、导入模型数据
    ITGroup *model = self.carArr[indexPath.section];
    // 2、创建单元格
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    // 3、设置单元格内容
    NSString *brand = model.cars[indexPath.row];
    cell.textLabel.text = brand;
    // 4、返回单元格对象
    return cell;
}
// MARK: 设置头部的值
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    ITGroup *model = self.carArr[section];
    return model.title;
}
// MARK: 设置尾部的值
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    ITGroup *model = self.carArr[section];
    return model.desc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
