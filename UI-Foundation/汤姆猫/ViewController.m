#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tom;
@property (weak, nonatomic) IBOutlet UIButton *drinkButton;
- (IBAction)drink:(UIButton *)sender;

@end

@implementation ViewController
// MARK: 获得图片的路径的块，已节约代码空间
NSString *(^myBlock)(NSString *, int) = ^(NSString *name, int i) {
    NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@_%02d.jpg", name, i] ofType:nil];
    return path;
};

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
// 喝牛奶按钮
- (IBAction)drink:(UIButton *)sender {
    [self action:@"drink" InDuration:5 RepeatCount:1];
}

// MARK: 动画汇总方法
- (void)action:(NSString *)action InDuration:(NSTimeInterval) duration RepeatCount:(int) count{
    NSMutableArray *arrM = [NSMutableArray array];
    int i = 0;
    NSFileManager *manager = [NSFileManager defaultManager];
    // 由于我们不知道需要调用多少动画，所以需要使用 while 循环进行判断
    while ([manager fileExistsAtPath:myBlock(action, i)]) {
        UIImage *tempImage = [UIImage imageWithContentsOfFile:myBlock(action, i)];
        [arrM addObject:tempImage];
        i++;
    }
    self.tom.animationImages = arrM;
    self.tom.animationRepeatCount = count;
    self.tom.animationDuration = duration;
    [self.tom startAnimating];
    [self performSelector:@selector(delete) withObject:nil afterDelay:duration];
}
- (void)delete {
    self.tom.animationImages = nil;
}
@end
