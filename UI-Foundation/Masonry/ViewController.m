//
//  ViewController.m
//  Masonry
//
//  Created by 雷维卡 on 2019/1/20.
//

#import "ViewController.h"
#import "Masonry.h"
/*
 第三方 Auto Layout 框架：Masonry （现在是因为有了iPhone X系列而无法使用，且要将当前项目的编译器修改成 Legacy Build System 才能正确运行）
 1、先将 Masonry 框架导入到项目当中。然后在需要的文件中导入。注意：导入的是 Masonry.h 文件即可
 2、在需要添加的 view 当中调用 mas_makeConstraints 方法。在这个方法的参数块中添加约束条件
    约束条件添加规范：
    1、详细添加各个位置的方法
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_topMargin).offset(20);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.height.mas_equalTo(40);
    }];
    2、将共同的值设置在一起，且可以不用指定第二个 view 的参照位置。
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        CGFloat margin = 20;
        // 这里面当中的 equalTo 块中的参数不用指定具体位置，框架可以自己进行判断。
        make.top.left.equalTo(self.view).offset(margin);
        make.right.equalTo(self.view).offset(-margin);
        make.height.equalTo([NSNumber numberWithDouble:margin]);
    }];
    3、利用 UIEdgeInsets 来设置
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        UIEdgeInsets edgeInsets = UIEdgeInsetsMake(20, 20, 20, 20);
        NSValue *value = [NSValue valueWithUIEdgeInsets:edgeInsets];
        make.edges.equalTo(value);
    }];
 */
@interface ViewController ()
@property (nonatomic, weak) UIView *redView;
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
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(35, 20, 20, 20));
    }];
    self.redView = redView;
}

@end
