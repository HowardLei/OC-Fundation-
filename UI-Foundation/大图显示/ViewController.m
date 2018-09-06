#import "ViewController.h"
/*
 UIScrollView（负责滚动，缩放的控件）允许用户通过拖动手指来控制控件中的内容。通过这个控件，我们可以显示多余一个屏幕的内容。
 里面有的属性
 1、contentsSize。即 UIScrollView 显示内容的大小。根据这个UIScrollView 可以判断内容需不需要被拖动。（设置的值为 CGSize 结构体）
 2、contentsOffset。即 UIScrollView 中内容的拖动距离。（设置的值为 CGPoint 结构体）
 */
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.contentSize = self.imageView.image.size;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
