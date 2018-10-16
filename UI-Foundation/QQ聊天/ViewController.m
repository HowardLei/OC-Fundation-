//
//  ViewController.m
//  QQ聊天
//
//  Created by jyz on 2018/10/15.
//

#import "ViewController.h"
#import "ITChat.h"
@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray *chatArr;
@property (weak, nonatomic) IBOutlet UITableView *chatTableView;

@end

@implementation ViewController
// MARK: 懒加载数据
- (NSArray *)chatArr {
    if (_chatArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"messages" ofType:@".plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *modelArr = [NSMutableArray array];
        for (NSDictionary *dictionary in arr) {
            ITChat *model = [ITChat chatWithDict:dictionary];
            [modelArr addObject:model];
        }
        _chatArr = modelArr;
    }
    return _chatArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

// MARK: - Table View data source
// 设置单元格格式
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ITChat *model = self.chatArr[indexPath.row];
    static NSString *ID = @"message";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}
// 设置 tableView 的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.chatArr.count;
}
@end
