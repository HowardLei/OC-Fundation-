//
//  ITViewController.m
//  加载自定义控制器
//
//  Created by apple on 2019/2/24.
//

#import "ITViewController.h"

@interface ITViewController ()

@end

@implementation ITViewController
// MARK: - view life circle
// 在管理 view 生命周期的时候，没有特殊情况都需要先调用父类方法
- (void)loadView {
    // 先让父类初始化 view
    [super loadView];
    // 也可以自己初始化一个 view ，但是不推荐。因为你需要保证你创建的 view 是个单例对象
    // self.view = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
    // 这样就可以保证是个单例对象。
    /*
     static dispatch_once_t onceToken;
     dispatch_once(&onceToken, ^{
        self.view = [[UIView alloc] initWithFrame:UIScreen.mainScreen.bounds];
     });
     */
    NSLog(@"%s", __FUNCTION__);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __FUNCTION__);
    self.view.backgroundColor = [UIColor redColor];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s", __FUNCTION__);
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%s", __FUNCTION__);
}
@end
