//
//  ViewController.m
//  QQ聊天
//
//  Created by jyz on 2018/10/15.
//

#import "ViewController.h"
#import "ITTableViewCell.h"
@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong) NSMutableArray *chatArr;
@property (weak, nonatomic) IBOutlet UITableView *chatTableView;
@property (weak, nonatomic) IBOutlet UITextField *messageTextField;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.messageTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 3, 1)];
    self.messageTextField.leftViewMode = UITextFieldViewModeWhileEditing;
    [self keyBoardPop];
}

// MARK: - 懒加载数据
- (NSMutableArray *)chatArr {
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

// MARK: - 处理键盘事件
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
    // 这个地方为了控制键盘弹出时间与 view 的弹出时间一致
    [UIView animateWithDuration:0.25 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, delta);
    }];
    [self scrollToLastRow];
}
// 当键盘弹出的时候，直接显示最后一行。注意：这个方法是在监听到键盘弹出来的时候再触发。
- (void)scrollToLastRow {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.chatArr.count - 1 inSection:0];
    // 滚动到指定行 方法： UITableView 对象 scrollToRowAtIndexPath:(NSIndexPath *)indexPath atScrollPosition:(UITableViewScrollPosition)scrollPosition animated:(BOOL)animated;
    [self.chatTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

// MARK: - Scroll View Delegate
// 当触发滚动条的时候，收起键盘
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

// MARK: - Text Field Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // 创建一个新模型，存储里面的数据
    ITChat *model = [[ITChat alloc] init];
    model.text = textField.text;
    model.type = ITChatPersonMe;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"今天 HH-mm";
    model.time = [formatter stringFromDate:[NSDate date]];
    [self.chatArr addObject:model];
    // 将数据添加完成以后，刷新数据
    [self.chatTableView reloadData];
    textField.text = nil;
    return YES;
}

// MARK: - Table View data source
// 设置单元格格式
- (ITTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cellForRowAtIndexPath");
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
    NSLog(@"numberOfRowInSection");
    return self.chatArr.count;
}

// MARK: - Table View delegate
// 设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"heightForRowAtIndexPath");
    ITChat *model = self.chatArr[indexPath.row];
    return model.height;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
