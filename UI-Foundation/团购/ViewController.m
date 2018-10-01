#import "ViewController.h"
#import "ITGoods.h"
#import "ITTableViewCell.h"
@interface ViewController () <UITableViewDataSource>
@property (nonatomic, strong) NSArray *modelsArr;
@end

@implementation ViewController
// 懒加载数据
- (NSArray *)modelsArr {
    if (_modelsArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs" ofType:@".plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *modelArr = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            ITGoods *model = [ITGoods goodsWithDict:dict];
            [modelArr addObject:model];
        }
        _modelsArr = modelArr;
    }
    return _modelsArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
// MARK: 设置单元格内容
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    // 1、导入模型数据
    ITGoods *model = self.modelsArr[indexPath.row];
    // 2、创建单元格
    /*
     用原来的方法写的代码如下
     static NSString *ID = @"goods_cell";
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
     if (!cell) {
     cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
     }
     */
    ITTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([ITTableViewCell class]) owner:nil options:nil] firstObject];
    // 3、设置单元格数据
//    cell.textLabel.text = model.title;
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"¥ %@    %@人好评", model.price, model.buyCount];
//    cell.imageView.image = [UIImage imageNamed:model.icon];
    // 4、返回单元格
    return cell;
}
// MARK:设置每个部分的行数
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelsArr.count;
}
@end
