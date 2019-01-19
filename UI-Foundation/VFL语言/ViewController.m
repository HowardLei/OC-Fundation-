//
//  ViewController.m
//  VFL语言
//
//  Created by 雷维卡 on 2019/1/18.
//

#import "ViewController.h"
/*
 Auto Layout 的布局方式之 VFL 布局
 VFL（可视化布局语言。用于进行自动布局）
 使用 VFL 布局需要调用 NSLayoutConstraint 中的类方法:+ (NSArray<__kindof NSLayoutConstraint *> *)constraintsWithVisualFormat:VFL 格式 options:布局格式（多选的） metrics:(nullable NSDictionary<NSString *,id> *)metrics views:在这个布局中参与布局的 view 所生成的字典（该字典一般通过调用字典宏(NSDictionaryOfVariableBindings)来创建）; 注意：这个返回值是数组。
 VFL 布局格式：
    1、确定布局方向 H:(Horizontal)、V:(Vertical)
    2、添加间距：|-需要添加的间距-|
    3、添加控件 [控件名]
    4、结束
 注意：在创建约束的时候一定要保证：
    1、先将需要创建的 view 的 translatesAutoresizingMaskIntoConstraints 属性改成 NO，否则会出现异常；
    2、在添加约束的时候，必须保证约束添加得当，不要多加也不要少加。
    3、在添加的时候，只能一次添加一个数组。否则格式会出现错误。（详细看方法中的泛型要求）
 
 补充:NSDictionaryOfVariableBindings()，这个宏创建的字典格式。（假设创建的控件名为 button, view）
    则该宏创建的字典是 @{@"button": button, @"view": view}
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self show];
}

- (void)show {
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    UIView *purpleView = [[UIView alloc] init];
    purpleView.backgroundColor = [UIColor purpleColor];
    purpleView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:purpleView];
    
    CGFloat margin = 35;
    CGFloat height = 50;
    NSString *redFormat = [NSString stringWithFormat:@"H:|-%g-[redView]-%g-|", margin, margin];
    NSArray<NSLayoutConstraint*> *redHorizontal = [NSLayoutConstraint constraintsWithVisualFormat:redFormat options:NSLayoutFormatAlignAllTop metrics:nil views:@{@"redView": redView}];
    [self.view addConstraints:redHorizontal];
    
    NSString *purpleVFLFormat1 = [NSString stringWithFormat:@"V:|-%g-[redView(%g)]-%g-[purpleView(%g)]", margin, height, margin, height];
    NSDictionary *purpleViews = NSDictionaryOfVariableBindings(redView, purpleView);
    NSArray<NSLayoutConstraint *> *purpleVertical = [NSLayoutConstraint constraintsWithVisualFormat:purpleVFLFormat1 options:NSLayoutFormatAlignAllLeft metrics:nil views:purpleViews];
    [self.view addConstraints:purpleVertical];
    
    NSString *purpleFormat2 = [NSString stringWithFormat:@"H:|-%g-[purpleView]-%g-|", margin, margin];
    NSDictionary *subPurpleView = NSDictionaryOfVariableBindings(purpleView);
    NSArray<NSLayoutConstraint *> *purpleHorizontal = [NSLayoutConstraint constraintsWithVisualFormat:purpleFormat2 options:NSLayoutFormatAlignAllTop metrics:nil views:subPurpleView];
    [self.view addConstraints:purpleHorizontal];
}

@end
