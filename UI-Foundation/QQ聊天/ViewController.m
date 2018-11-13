//
//  ViewController.m
//  QQ聊天
//
//  Created by jyz on 2018/10/15.
//

#import "ViewController.h"
#import "ITTableViewCell.h"
@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *chatArr;
@property (weak, nonatomic) IBOutlet UITableView *chatTableView;
@property (weak, nonatomic) IBOutlet UITextField *messageTextField;

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
            NSString *lastModelTime = [[modelArr lastObject] time];
            // 在添加单元格的时候，判断是否上个单元格中的时间与下个相同。如果相同就隐藏，否则不隐藏。
            if ([model.time isEqualToString:lastModelTime]) {
                model.timeHidden = YES;
            }
            [modelArr addObject:model];
        }
        _chatArr = modelArr;
    }
    return _chatArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.messageTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 3, 1)];
    self.messageTextField.leftViewMode = UITextFieldViewModeWhileEditing;
    [self keyBoardPop];
}

/**
 管理键盘弹出事件
 */
- (void)keyBoardPop {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(doWhenKeyboardFrameChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
}
// 当监听到键盘的 frame 即将改变的时候，执行以下方法
- (void)doWhenKeyboardFrameChange:(NSNotification *)notification {
    /*
     思路：当键盘弹入屏幕的时候，控制 view 中 y 方向上的偏移量即可。
     即键盘的y值减去view的高度即可。
     */
    CGFloat keyboardHeight = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue].origin.y - [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y;
    CGFloat delta = self.view.frame.origin.y - keyboardHeight;
    self.view.transform = CGAffineTransformMakeTranslation(0, delta);
}
// MARK: - Table View data source
// 设置单元格格式
- (ITTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ITChat *model = self.chatArr[indexPath.row];
    static NSString *ID = @"message";
    ITTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ITTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    // 设置单元格数据
    cell.model = model;
    return cell;
}
// 设置 tableView 的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.chatArr.count;
}
// MARK: - Table View delegate
// 设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ITChat *model = self.chatArr[indexPath.row];
    return model.height;
}

@end
