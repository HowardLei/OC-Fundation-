#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1、在 UIScrollView 中设置滚动图片
    CGFloat width = 300;
    CGFloat height = 130;
    int images = 5;
    for (int i = 0; i < images; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        NSString *imageName = [NSString stringWithFormat:@"img_%02d", i + 1];
        imageView.image = [UIImage imageNamed:imageName];
        CGFloat imageX = i * width;
        CGFloat imageY = 0;
        imageView.frame = CGRectMake(imageX, imageY, width, height);
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.contentSize = CGSizeMake(images * width, 0);
    // 2、设置图片自动滚动
    // 注意：当直接调用 NSTimer 类方法的时候，这个计时器会持续不断的运行。如果中间用户有拖拽这个 View 的时候，如果拖动的时间偏长，就会出现 2 张图片比方法中设计的时间更短的时间经过。
    // 解决方案：当发现用户拖动的时候，停止计时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
    // 注意：如果界面上还有其他的滚动控件的时候，如果滚动其他的控件的时候，就会影响图片的自动滚动。
    // 解决方案：提高 timer 线程的优先级，保证图片能够一直自动滚动。
    // 获取当前对象的消息循环对象
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    // 改变 timer 对象的优先级。设置模式为：NSRunLoopCommonModes。
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}
// MARK: 设置 PageControl 的页码 (通过 scrollView 中的 offset 来判断页码的位置)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x;
    // 注意：这个地方的增加的是 1/2 个 scrollView.frame 。而不是 offset 。
    CGFloat halfOffsetX = scrollView.frame.size.width / 2;
    offsetX += halfOffsetX;
    self.pageControl.currentPage = (NSInteger) (offsetX / scrollView.frame.size.width);
}
// MARK: 检测用户是否拖动 scrollView
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    // 当发现用户拖动的时候，就调用 invalidate 方法。停止计时器。
    [self.timer invalidate];
    // 当计时器停止了以后，上边的计时器对象就没用了，就需要指向一个新的计时器对象才能重新计时。
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
}
// MARK: 实现自动滚动
- (void)autoScroll {
    // 每次执行这个方法，让页面滚动一页。
    // 注意：滚动是靠偏移量来执行的。
    NSInteger page = self.pageControl.currentPage;
    if (page == self.pageControl.numberOfPages - 1) {
        page = 0;
    } else {
        page++;
    }
    [self.scrollView setContentOffset:CGPointMake(page * self.scrollView.frame.size.width, 0) animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
