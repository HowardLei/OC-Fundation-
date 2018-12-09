//
//  ITTableViewController.m
//  App管理
//
//  Created by jyz on 2018/12/5.
//

#import "ITTableViewController.h"
#import "ITApp.h"
#import "ITAppCell.h"
@interface ITTableViewController () <ITAppCellDelegate>
@property (nonatomic, strong) NSArray *modelArr;
@property (nonatomic, weak)UILabel *label;
@end

@implementation ITTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 60;
}

// MARK: - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

// MARK: - Table view delegate
- (ITAppCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /*
     有关单元格的自定义 cell
     1、如果显示的内容基本相同，就是个别数据不同时，可以使用 xib
     2、但是 xib 使用的时候还需要代码导入，如果不想在 controller 中导入 xib 的时候，就可以直接使用 UITableView 的 cell 模板。通过设置重用 ID 来创建单元格。将需要设置的控件拖到 cell 当中即可。
     */
    ITApp *model = self.modelArr[indexPath.row];
    static NSString *ID = @"appID";
    ITAppCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.model = model;
    cell.delegate = self;
    return cell;
}
// MARK: Lazy loading plist data
- (NSArray *)modelArr {
    if (_modelArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"apps_full" ofType:@".plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *modelArr = [NSMutableArray array];
        for (NSDictionary *dictionary in arr) {
            ITApp *model = [ITApp appWithDict:dictionary];
            [modelArr addObject:model];
        }
        _modelArr = modelArr;
    }
    return _modelArr;
}
// FIXME: label 的属性没写好
- (void)showLabel {
    UILabel *label = [[UILabel alloc] init];
    self.label = label;
    NSTimeInterval delayTime = 0.5;
    [UIView animateWithDuration:delayTime animations:^{
        [self setLabelContent];
        [self setLabelFrame];
        [self.view addSubview:label];
    }];
    [self performSelector:@selector(hideLabel) withObject:nil afterDelay:delayTime * 2];
}

- (void)setLabelFrame{
    CGFloat labelWidth = self.view.bounds.size.width;
    CGFloat labelHeight = 30;
    CGFloat labelX = 0;
    CGFloat labelY = (self.view.bounds.size.height - labelHeight) / 2;
    self.label.frame = CGRectMake(labelX, labelY, labelWidth, labelHeight);
}

- (void)setLabelContent {
    self.label.backgroundColor = [UIColor greenColor];
    self.label.alpha = 0.8;
    self.label.text = @"开始下载";
    self.label.textColor = [UIColor blackColor];
    self.label.textAlignment = NSTextAlignmentCenter;
}
- (void)hideLabel{
    [UIView animateWithDuration:0.5 animations:^{
        self.label.alpha = 0;
    }];
    self.label = nil;
}
@end
