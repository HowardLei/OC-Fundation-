#import "ITHeaderView.h"

@interface ITHeaderView () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ITHeaderView
// 在已启动一个 App 的时候，每个加载 nib 文件的对象（这些对象和消息已经被加载完成和初始化了）都会收到一个 awakeFromNib 的消息。当他们收到这个消息的时候，他们的 outlet 和 action 连接就已经被建立起来了（摘录自：awakeFromNib 文档当中）。
// 在这个方法中，实现 nib 中控件属性的设置
- (void)awakeFromNib {
    CGFloat imageHeight = 110;
    CGFloat imageWidth = 300;
    int images = 5;
    self.scrollView.contentSize = CGSizeMake(imageWidth * images, 0);
    // 向 scrollView 中添加图片
    for (int i = 0; i < images; i++) {
        NSString *imageName = [NSString stringWithFormat:@"ad_%02d", i];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        CGFloat imageX = i * imageWidth;
        CGFloat imageY = 0;
        imageView.frame = CGRectMake(imageX, imageY, imageWidth, imageHeight);
        [self.scrollView addSubview:imageView];
    }
    // 自动滚动
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
    // 注意：一旦重写这个方法，必须要调用其父类方法。
    [super awakeFromNib];
}
+ (instancetype)headerViewFromNib:(NSString *)nib {
    ITHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:nib owner:nil options:nil] lastObject];
    return headerView;
}

/**
 根据页数判断是否自动滚动
 */
- (void)autoScroll{
    NSInteger pages = self.pageControl.currentPage;
    if (pages == self.pageControl.currentPage - 1) {
        pages = 0;
    } else {
        pages++;
    }
    [self.scrollView setContentOffset:CGPointMake(pages * self.scrollView.frame.size.width, 0) animated:YES];
}

/**
 设置页面滚动后做的事情
 @param scrollView 当前的 scrollView
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = self.scrollView.frame.size.width;
}
@end
