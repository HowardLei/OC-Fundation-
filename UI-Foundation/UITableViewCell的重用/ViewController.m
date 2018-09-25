#import "ViewController.h"
#import "ITHero.h"

/*
 为什么要对 UITableView 中的 Cell 进行重用？
    因为滚动的时候，都会经历 cell 的创建和回收，不显示的内容删除，显示的对象被创建。这个操作虽然对内存的影响不大，但会不断的进行内存的开辟与销毁，消耗 CPU 的性能。所以需要对 Cell 进行更高效的回收利用。
 对 Cell 进行重用的时候，思路如下：
    1、在创建单元格的时候指定一个“重用 ID ”
    2、在需要一个单元格的时候，先去缓存池中根据“重用 ID ”查找是否有可用的单元格
    3、如果有，则直接从缓冲池中取出这个单元格进行使用（修改这个单元格中的样式以及内容）
       如果没有，此时则需要重新创建一个单元格
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
    NSString *ID = @"HeroID";
    // 根据上边创建的 ID 去缓存区中寻找对应的 Cell，注意：这个操作是由这个方法内部完成的。
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 判断缓存区中有没有 cell ，没有则创建一个
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
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
