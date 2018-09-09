#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *longImage;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *buttonView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat height = CGRectGetMaxY(self.longImage.frame);
    self.scrollView.contentSize = CGSizeMake(0, height);
    self.scrollView.contentOffset = CGPointMake(0, -CGRectGetMaxY(self.topView.frame));
    self.scrollView.contentInset = UIEdgeInsetsMake(CGRectGetMaxY(self.topView.frame), 0, self.buttonView.frame.size.height, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
