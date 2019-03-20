#import "ViewController.h"
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
        _App = tempArr;
    }
    return _App;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 定义行元素数
    NSInteger rowElements = 4;
    // 将这里面的所有 App 全部添加进来
    CGFloat marginTop = 25;
    // 注意：这里面的 80 实际上是下边的 width 属性的值。
    CGFloat marginX = (CGRectGetWidth(self.view.frame) - (rowElements * 80)) / (rowElements + 1.0);
    for (int i = 0; i < self.App.count; i++) {
        // 将数组中的每个字典导出来
        NSDictionary *appDict = self.App[i];
        // MARK: 1、先创建一个 view
        UIView *view = [[UIView alloc] init];
        // MARK: 2、对这个 view 的大小进行设置
        // MARK: 2.1 设置 view 大小
        CGFloat width = 80;
        CGFloat height = 90;
        // MARK: 2.2 设置位置
        CGFloat x = marginX + (width + marginX) * (i % rowElements);
        CGFloat y = marginTop + (height + marginTop) * (i / rowElements);
        view.frame = CGRectMake(x, y, width, height);
        // MARK: 2.3、将 view 添加到主 view 当中
        [self.view addSubview:view];
        // MARK: 3、在上边的 View 中添加子控件
        // MARK: 3.1.1 布局 imageView
        UIImageView *appImage = [[UIImageView alloc] init];
        CGFloat appImageWidth = 50;
        CGFloat appImageHeight = 50;
        CGFloat appImageX = (CGRectGetWidth(view.frame) - appImageWidth) / 2;
        CGFloat appImageY = 0;
        appImage.frame = CGRectMake(appImageX, appImageY, appImageWidth, appImageHeight);
        // MARK: 3.1.2 为这个 imageView 添加数据
        appImage.image = [UIImage imageNamed:appDict[@"icon"]];
        [view addSubview:appImage];
        
        // MARK: 3.2.1 添加一个 label
        UILabel *appLabel = [[UILabel alloc] init];
        CGFloat appLabelWidth = CGRectGetWidth(view.frame);
        CGFloat appLabelHeight = 20;
        CGFloat appLabelX = 0;
        CGFloat appLabelY = appImageHeight;
        appLabel.frame = CGRectMake(appLabelX, appLabelY, appLabelWidth, appLabelHeight);
        // MARK: 3.2.2 为 label 添加数据
        appLabel.text = appDict[@"name"];
        appLabel.font = [UIFont systemFontOfSize:13];
        appLabel.textAlignment = NSTextAlignmentCenter;
        [view addSubview:appLabel];
        
        // MARK: 3.3.1 添加一个 button
        UIButton *downloadButton = [[UIButton alloc] init];
        CGFloat downloadButtonWidth = appImageWidth;
        CGFloat downloadButtonHeight = view.frame.size.height - appLabelHeight - appImageHeight;
        CGFloat downloadButtonX = appImageX;
        /*
         补充：在求按钮的Y值的时候，有两种算法
            1、将上边的控件的高度求和即可。
               即：downloadButtonY = appImageHeight + appLabelY
            2、由于 downloadButton 的位置设计与 appLabel 的底边相同。则可以通过调用函数 CGRectGetMaxY 来获得 appLabel 的底边的 Y 坐标。参数为
                CGRect。
         */
        CGFloat downloadButtonY = CGRectGetMaxY(appLabel.frame);
        downloadButton.frame = CGRectMake(downloadButtonX, downloadButtonY, downloadButtonWidth, downloadButtonHeight);
        // MARK: 3.3.2 为 button 添加数据
        // MARK: 3.3.2.1 设置 button 的背景图片
        [downloadButton setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
        [downloadButton setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
        // MARK: 3.3.2.2 设置 button 在不同状态下的按钮样式
        /*
         由于每个 UIButton 对象都会有 4 个状态，所以需要调整不同状态下的显示。
            所以不能通过简单的调用属性解决，需要调用方法才行。
            通过调用 setTitle forState 方法解决。
         */
        [downloadButton setTitle:@"下载" forState:UIControlStateNormal];
        [downloadButton setTitle:@"正在下载" forState:UIControlStateSelected];
        [downloadButton setTitle:@"已安装" forState:UIControlStateDisabled];
        // MARK: 3.3.2.3 对 button 里面的数据进行排版
        /*
         由于 UIButton 这个控件是由多个控件构成的，里面含 UIImageView/UILabel/UIControl 等控件构成的，所以在调整 UIButton 对象里面的字体内容的时候，是调用其中的 titleLabel 属性。然后再调里面控制文本的属性。
         */
        downloadButton.titleLabel.font = [UIFont systemFontOfSize:14];
        downloadButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [downloadButton addTarget:self action:@selector(clickInstall) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:downloadButton];
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
