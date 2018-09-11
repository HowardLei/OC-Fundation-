#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 滚动图片
    CGFloat width = 300;
    CGFloat height = 130;
    for (int i = 0; i < 5; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        NSString *imageName = [NSString stringWithFormat:@"img_%02d", i + 1];
        imageView.image = [UIImage imageNamed:imageName];
        CGFloat imageX = i * width;
        CGFloat imageY = 0;
        imageView.frame = CGRectMake(imageX, imageY, width, height);
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.contentSize = CGSizeMake(1500, 0);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
