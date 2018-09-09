#import "ViewController.h"
/*
 缩放事件与滚动事件相类似，都需要代理对象来进行监听
 设置缩放事件代理如下：
 1、指定代理对象，并且让该对象支持该代理协议
 2、通过代理监听该事件，并且返回需要缩放的控件。
 3、设置缩放比
 */
@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.contentSize = self.imageView.image.size;
    self.scrollView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    self.scrollView.minimumZoomScale = 0.1;
    self.scrollView.maximumZoomScale = 5;
}
//MARK: 当开始捏合屏幕的时候，就触发这个方法，并返回需要缩放的对象
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    NSLog(@"111");
    return self.imageView;
}
// MARK: 即将开始缩放的时候调用此方法。注意：一旦调用这个方法，必然先调用获得 View 的方法。
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {
    NSLog(@"我马上开始缩放了");
}
// MARK: 正在缩放的时候调用如下方法，缩放不停，这个方法就不断地被调用。
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    NSLog(@"我一直在缩放");
}
// MARK: 缩放结束的时候调用这个方法
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    NSLog(@"我结束了");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
