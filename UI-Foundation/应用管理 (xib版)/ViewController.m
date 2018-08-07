#import "ViewController.h"
#import "ITApp.h"
#import "ITAppView.h"
/*
 需求：做一个应用安装管理界面（默认5宫格的）
 思路：1、先设计出一个动态添加应用界面。
 1）为每一个 App 摆放的位置定位
 2）将里面的控件进行定位
 3）定位完成以后，再将数据这个添加到控件当中
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
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSDictionary *dict in tempArr) {
            ITApp *appModel = [ITApp appWithDict:dict];
            [arrM addObject:appModel];
        }
        _App = arrM;
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
        // 将数组中的每个字典导出来
        ITApp *model = self.App[i];
        // MARK: 1、将 xib 文件中的模型导入到 view 当中。
        ITAppView *subview = [ITAppView appViewWithNib:@"ITAppView"];
        // MARK: 2、对这个 view 的大小进行设置
        // MARK: 2.1 设置 view 大小
        CGFloat width = 80;
        CGFloat height = 90;
        // MARK: 2.2 设置位置
        CGFloat x = marginX + (width + marginX) * (i % rowElements);
        CGFloat y = marginTop + (height + marginTop) * (i / rowElements);
        subview.frame = CGRectMake(x, y, width, height);
        // 将里面的
        subview.model = model;
        // MARK: 2.3、将 view 添加到主 view 当中
        [self.view addSubview:subview];
    }
}
// MARK: 点击安装触发的方法
- (void)clickInstall {
    NSLog(@"正在安装");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
