#import "ViewController.h"
/*
 需求：做一个应用安装管理界面（默认5宫格的）
 思路：1、先设计出一个动态添加应用界面。
        1）为每一个 App 定位
        
 */
@interface ViewController ()
@property (strong, nonatomic) NSArray *App;
@end

@implementation ViewController
// MARK: 加载数组中的数据
- (NSArray *)App {
    if (_App == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"app" ofType:@".plist"];
        NSArray *tempArr = [NSArray arrayWithContentsOfFile:path];
        _App = tempArr;
    }
    return _App;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 定义行元素数
    int rowElements = 4;
    // 将这里面的所有 App 全部添加进来
    CGFloat marginTop = 25;
    // 注意：这里面的 80 实际上是下边的 width 属性的值。
    CGFloat marginX = (self.view.frame.size.width - (rowElements * 80)) / (rowElements + 1.0);
    for (int i = 0; i < self.App.count; i++) {
        // 1、先创建一个 view
        UIView *view = [[UIView alloc] init];
        // 2、对这个 view 的大小颜色进行设置
        // 2.1 设置 view 大小
        CGFloat width = 80;
        CGFloat height = 90;
        // 2.2 设置位置
        CGFloat x = marginX + (width + marginX) * (i % rowElements);
        CGFloat y = marginTop + (height + marginTop) * (i / rowElements);
        view.frame = CGRectMake(x, y, width, height);
        view.backgroundColor = [UIColor blueColor];
        // 3、将 view 添加到主 view 当中
        [self.view addSubview:view];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
