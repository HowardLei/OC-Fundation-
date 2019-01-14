//
//  ViewController.m
//  代码实现AutoLayout
//
//  Created by apple on 2019/1/14.
//

#import "ViewController.h"
/*
 用代码实现 AutoLayout 的步骤
 1、将项目中的需要进行的 AutoLayout 的控件关闭。属性：translatesAutoresizingMaskIntoConstraints 注意：是需要进行 AutoLayout 的控件，不是直接关闭这个 view 的即可。
 2、创建 1 个 NSLayoutConstraint 对象。设置约束规则。
 3、将约束规则添加到适当的控件当中。（注意：控件不需要再设置 frame ）。
 */
/*
 需求：在控制器中添加 2 个 view, 1 个蓝色，1 个红色
    1、2 个 view 高度永远相同，高度为 50
    2、红色 view 和蓝色 view 右边对齐
    3、蓝色 view 距父控件左边、右边、上边间距相同。均为30
    4、蓝色 view 距离红色 view 间距固定。均为 30
    5、红色 view 的左边和父控件的中点对齐。（红色的 view 是蓝色的 view 的一半）
 设置思路：
    1、创建蓝色 view ，设置高度为 50，距左边、右边、上边间距为 30 。
    2、创建红色 view ，设置高度与宽度与蓝色 view 一致，上间距为 30。右边的间距为 30
    3、选择设置红色 view 宽度的那一个 constraints 。点击右边栏中的 size inspectors 。选择 multiplier 倍数，选择 0.5 即可。
 */
@interface ViewController ()
@property(nonatomic, weak) UIView *blueView;
@property(nonatomic, weak) UIView *redView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置蓝色 view
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    self.blueView = blueView;
    self.blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self setBlueConstraint];

    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    self.redView = redView;
    self.redView.translatesAutoresizingMaskIntoConstraints = NO;
}
/**
 设置蓝色 view 的 AutoLayout
 */
- (void)setBlueConstraint {
    // 创建父类 view
    UIView *fatherView = self.blueView.superview;
    // 创建默认间距
    CGFloat blueDefaultMargin = 30;
    /* 注意：代码设置 AutoLayout 的方法：
    + (instancetype)constraintWithItem:需要设置的控件1 attribute:控件1的哪个位置 relatedBy:等价关系（>= || = || <= 三选一） toItem:需要设置的控件2（没有写 nil） attribute:控件2的哪个位置（如果前面的参数为 nil，这个地方写:NSLayoutAttributeNotAnAttribute） multiplier:倍数 constant:需要添加的变量大小;
    满足这个公式：控件1的位置 关系 控件2的位置 * 倍数 + 常数（左负有正，上负下正）
     */
    NSLayoutConstraint *blueHeight = [NSLayoutConstraint constraintWithItem:self.blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50];
    [self.blueView addConstraint:blueHeight];
    NSLayoutConstraint *blueTop = [NSLayoutConstraint constraintWithItem:self.blueView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:fatherView attribute:NSLayoutAttributeTop multiplier:1 constant:blueDefaultMargin];
    NSLayoutConstraint *blueleft = [NSLayoutConstraint constraintWithItem:self.blueView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:fatherView attribute:NSLayoutAttributeLeft multiplier:1 constant:blueDefaultMargin];
    NSLayoutConstraint *blueRight = [NSLayoutConstraint constraintWithItem:self.blueView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:fatherView attribute:NSLayoutAttributeRight multiplier:1 constant:-blueDefaultMargin];
    NSArray<NSLayoutConstraint *> *arr = @[blueTop, blueleft, blueRight];
    [fatherView addConstraints:arr];
}
/**
 设置红色 view 的 AutoLayout
 */
- (void)setRedConstraint {
    UIView *brotherView = self.blueView;
    CGFloat redDefaultMargin = 30;
    NSLayoutConstraint *redHeight = [NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.blueView attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    NSLayoutConstraint *redTop = [NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:brotherView attribute:NSLayoutAttributeBottom multiplier:1 constant:redDefaultMargin];
    NSLayoutConstraint *redRight = [NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.redView.superview attribute:NSLayoutAttributeRight multiplier:1 constant:-redDefaultMargin];
    NSLayoutConstraint *redLeft = [NSLayoutConstraint constraintWithItem:self.redView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:brotherView attribute:NSLayoutAttributeLeft multiplier:0.5 constant:0];
    // FIXME: 间距设置完成，数组还没创建
}
@end
