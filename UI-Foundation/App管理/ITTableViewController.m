//
//  ITTableViewController.m
//  App管理
//
//  Created by jyz on 2018/12/5.
//

#import "ITTableViewController.h"
#import "ITAppCell.h"

@interface ITTableViewController () <ITAppCellDelegate>
@property (nonatomic, strong) NSArray<ITApp *> *modelArr;
@property (nonatomic, weak) UILabel *label;
@end

@implementation ITTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 60;
}

// MARK: - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelArr.count;
}

// MARK: - Table view delegate
- (ITAppCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /*
     有关单元格的自定义 cell
     1、如果显示的内容基本相同，就是个别数据不同时，可以使用 xib
     2、但是 xib 使用的时候还需要代码导入，如果不想在 controller 中导入 xib 的时候，就可以直接使用 UITableView 的 cell 模板。通过设置重用 ID 来创建单元格。将需要设置的控件拖到 cell 当中即可。
     */
    ITApp *model = self.modelArr[indexPath.row];
    static NSString *const ID = @"appID";
    ITAppCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.model = model;
    cell.delegate = self;
    return cell;
}
// MARK: Lazy loading plist data
- (NSArray<ITApp *> *)modelArr {
    if (_modelArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"apps_full" ofType:@".plist"];
        NSArray<NSDictionary *> *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray<ITApp *> *modelArr = [NSMutableArray arrayWithCapacity:arr.count];
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
    [UIView animateWithDuration:0.5 animations:^{
        self.label.alpha = 0.7;
        self.view.userInteractionEnabled = NO;
    } completion:^(BOOL finished) {
        finished == YES ? [self performSelector:@selector(hideLabel) withObject:nil afterDelay:0.5 * 2] : NULL;
    }];
    [self.view addSubview:self.label];
}

- (void)setLabelFrame {
    CGFloat labelWidth = CGRectGetWidth(UIScreen.mainScreen.bounds);
    CGFloat labelHeight = 30;
    CGFloat labelX = 0;
    CGFloat labelY = (CGRectGetHeight(UIScreen.mainScreen.bounds) - labelHeight) / 2;
    self.label.frame = CGRectMake(labelX, labelY, labelWidth, labelHeight);
    self.label.layer.masksToBounds = YES;
    self.label.layer.cornerRadius = 5;
}

- (void)setLabelProperty {
    self.label.backgroundColor = [UIColor greenColor];
    self.label.text = @"开始下载";
    self.label.font = [UIFont systemFontOfSize:16];
    self.label.textColor = [UIColor blackColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.alpha = 0;
}

- (void)hideLabel {
    [UIView animateWithDuration:1 animations:^{
        self.label.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self.label removeFromSuperview];
            self.view.userInteractionEnabled = YES;
        }
    }];
    self.label = nil;
}

- (void)setLabel:(UILabel *)label {
    _label = label;
    [self setLabelFrame];
    [self setLabelProperty];
}

@end
