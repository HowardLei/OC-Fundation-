#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
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
}
// MARK: 设置 PageControl 的页码 (通过 scrollView 中的 offset 来判断页码的位置)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x;
    // 注意：这个地方的增加的是 1/2 个 scrollView.frame 。而不是 offset 。
    CGFloat halfOffsetX = scrollView.frame.size.width / 2;
    offsetX += halfOffsetX;
    self.pageControl.currentPage = offsetX / scrollView.frame.size.width;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
