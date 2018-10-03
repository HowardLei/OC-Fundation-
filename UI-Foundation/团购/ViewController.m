#import "ViewController.h"
#import "ITGoods.h"
#import "ITTableViewCell.h"
#import "ITHeaderView.h"
#import "ITFooterView.h"
@interface ViewController () <UITableViewDataSource, ITFooterViewDelegate>
@property (nonatomic, strong) NSMutableArray *modelsArr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    ITHeaderView *headerView = [ITHeaderView headerViewFromNib:NSStringFromClass([ITHeaderView class])];
    self.tableView.tableHeaderView = headerView;
    ITFooterView *footerView = [ITFooterView footerViewFromNib:NSStringFromClass([ITFooterView class])];
    footerView.delegate = self;
    self.tableView.tableFooterView = footerView;
}
// 懒加载数据
- (NSMutableArray *)modelsArr {
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
     注意：如果直接在控制器中写这部分代码，就会造成一下局面
        1、控制器知道的内容太多，导致一旦单元格中的属性发生变化，则所有有单元格的控制器都需要修改代码，过于依赖控制器。
        2、单元格本身封装的也并不完整。还需要程序员手动设置属性。
     */
    ITTableViewCell *cell = [ITTableViewCell tableViewCellWithTableView:tableView];
    // 3、设置单元格数据
    // 这次是将数据封装到一个属性当中
    cell.goods = model;
    // 4、返回单元格
    return cell;
}
// MARK:设置每个部分的行数
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelsArr.count;
}
// MARK: 控制器作为代理对象，实现 ITFooterViewDelegate 协议中的方法
- (void)addElementInTableView:(ITFooterView *)tableView {
    // 一、创建一个新模型
    ITGoods *model = [[ITGoods alloc] init];
    model.buyCount = @"123";
    model.icon = @"37e4761e6ecf56a2d78685df7157f097";
    model.price = @"6";
    model.title = @"肉夹馍";
    // 二、将模型中的数据添加到模型数组中
    [self.modelsArr addObject:model];
    // 三、刷新数据（这个地方不能使用 reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *) withRowAnimation:(UITableViewRowAnimation)这个方法，因为上边这个方法是先在原有的单元格中删除需要操作的单元格数据，再刷新新的数据，没办法添加新的单元格。）
    [self.tableView reloadData];
    // 四、如果单元格刷新出来的以后超出 tableView 的显示区域，则将显示界面自动向上滚动一行
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.modelsArr.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}
@end
