#import "ViewController.h"
#import "ITGroup.h"
#import "ITCars.h"
@interface ViewController () <UITableViewDataSource>
@property (nonatomic, strong) NSArray *models;
@property (weak, nonatomic) IBOutlet UITableView *modelTableView;
@end

@implementation ViewController
// 懒加载数据
- (NSArray *)models {
    if (!_models) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_total" ofType:@".plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *modelsArr = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            ITGroup *model = [ITGroup groupWithDict:dict];
            [modelsArr addObject:model];
        }
        _models = modelsArr;
    }
    return _models;
}
// 设置每行单元格显示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1、将模型导入进来
    ITGroup *model = self.models[indexPath.section];
    ITCars *car = model.cars[indexPath.row];
    // 2、创建单元格
    static NSString *ID = @"car_brand";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.textLabel.text = car.name;
    return cell;
}
//MARK:设置一共有多少个组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.models.count;
}
// MARK: 设置每个组中的每一行都显示什么内容
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ITGroup *model = self.models[section];
    return model.cars.count;
}
// MARK: 为头部添加数据
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.models[section] title];
}
// MARK: 设置设置右侧索引
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSArray *test = [self.models valueForKeyPath:NSStringFromSelector(@selector(title))];
    return test;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
