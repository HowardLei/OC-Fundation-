#import "ViewController.h"
/*
 关于 UITableView 显示数据的基本思路
 1、在 UITableView 中设置 dataSource 对象。该对象必须遵守 UITableView 的 <UITableViewDataSource>
 2、dataSource 对象必须实现协议中的 @required 的方法。这些方法的作用就是告诉 UITableView 该如何显示数据。
 3、当 UITableView 运行起来的时候，就会不断的调用从这些方法中获得对应的数据，并且将其显示出来。
 */
@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
// MARK: 告诉 UITableView 每一组每一行显示什么单元格内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = @"王尼玛";   
    return cell;
}
// MARK: 告诉 UITableView 每组显示几条数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
