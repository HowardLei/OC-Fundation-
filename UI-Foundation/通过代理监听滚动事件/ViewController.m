#import "ViewController.h"
/*
 当有些事件无法通过 addTarget 方法进行监听的时候，就需要我们利用代理进行监听。
 通过代理监听滚动事件步骤：
 1、为 UIScrollView 设置一个代理对象。让代理对象遵守 UIScrollViewDelegate 协议。遵守了这个协议，保证代理对象拥有对应的方法。（设置代理有 2 种方法，1、脱线到控制器，2、设置 delegate 属性）
 2、当 UIScrollView 里面的事件被触发的时候，UIScrollView 就会自动寻找代理对象的某个方法，并且调用这个方法。（这样就实现了事件的机制）
 3、我们需要做的就是在代理对象中的相应方法中，重新编写我们的代码。然后当 UIScrollView 中的某个时间被触发的时候，就可以自动执行里面的代码
 注意：一般情况下，建议使用当前控制器作为代理对象。
 代理设计模式的最终目的：解耦
 */
@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *deathImage;

@end

@implementation ViewController

// 当 ScrollView 里面的控件发生任何滚动，就会触发这个方法。
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"x = %g, y = %g", scrollView.contentOffset.x, scrollView.contentOffset.y);
}
// 当 scrollView 中即将开始拖拽的时候，触发这个方法
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"开始滚动");
}
// 当用户停止拖拽的时候，触发这个方法。注意：动画可能由于惯性依旧还在进行中。
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"看看");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.contentSize = self.deathImage.frame.size;
    self.scrollView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
