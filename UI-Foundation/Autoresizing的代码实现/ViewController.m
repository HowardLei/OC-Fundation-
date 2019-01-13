//
//  ViewController.m
//  Autoresizing的代码实现
//
//  Created by apple on 2019/1/11.
//

#import "ViewController.h"
/*
 需求：
 用代码创建两个 view ，点击一个按钮，父 view 扩大，子 view 的下边紧贴父 view 的底栏。子 view 的高度保持不变。
 */
@interface ViewController ()
@property (nonatomic, weak) UIView *blueView;
@property (nonatomic, weak) UIView *redView;
@property (weak, nonatomic) IBOutlet UIButton *changeViewButton;
- (IBAction)changeView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建一个蓝色的 view 。作为父 view 。
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    self.blueView = blueView;
    // 创建一个红色的 view
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    CGFloat redViewH = 20;
    CGFloat redViewW = self.blueView.frame.size.width;
    CGFloat redViewX = 0;
    CGFloat redViewY = CGRectGetMaxY(self.blueView.frame) - redViewH;
    redView.frame = CGRectMake(redViewX, redViewY, redViewW, redViewH);
    [self.blueView addSubview:redView];
    self.redView = redView;
    /*
     注意：代码设置 autoresizingMask 的时候，他的选项类型不是一般枚举，他是：按位掩码类型的枚举
     NS_OPTIONS 与 NS_ENUM 之间的关系
     NS_OPTIONS 是用于多选操作的时候的选项。利用位操作符来进行运算。注意：这里面的或是位操作符的或‘|’。
     NS_ENUM 用于单选枚举中。不可以进行多选当中。
     */
    /*
     关于位操作符的整理
     所有的操作数都先转化为二进制保存在内存中再进行运算。
     1、<< 左移运算符 1 << 2 表示将 1 在内存中左移 2 位。相当与 00000001 变成 00000100
     2、 >> 右移运算符 1 >> 2 表示将 1 在内存中右移 2 位。（注意：超出部分忽略不计）
     3、 & 按位与运算符，将数中的每位都进行比较。（1 & 任何 = 任何，0 & 任何 = 0）
     4、 | 按位或运算符，用于 NS_OPTION 的多选。（1 | 任何 = 1， 0 | 任何 = 任何）
     5、 ^ 按位异或运算符（与平方运算符作区分。平方运算只能用 pow 函数进行运算）（两位相同为 0 ，不同为 1）
     */
    self.redView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
}

- (void)changeView {
    CGRect blueFrame = self.blueView.frame;
    blueFrame.size.height += 20;
    blueFrame.size.width += 20;
    self.blueView.frame = blueFrame;
}
@end
