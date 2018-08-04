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
        /*
         注意：对于 imageNamed 方法与 imageWithContentsOfFile 的选择
            1、如果选择 imageNamed 方法的话，就会首先在系统缓存中根据指定的名字寻找图片,如果找到了就返回。如果没有在缓存中找到图片,该方法会从指定的文件中加载图片数据,并将其缓存起来,然后再把结果返回,下次再使用该名称图片的时候就省去了从硬盘中加载图片的过程。对于相同名称的图片,系统只会把它Cache到内存一次。
            2、如果选择 imageWithContentsOfFile 方法的话，只是简单的加载图片,并不会将图片缓存起来,图像会被系统以数据方式加载到程序。当你不需要重用该图像,或者你需要将图像以数据方式存储到数据库,又或者你要通过网络下载一个很大的图像时,可以使用这种方式。
            3、如何选择
                如果加载一张很大的图片,并且只使用一次,那么就不需要缓存这个图片。这种情况imageWithContentsOfFile比较合适——系统不会浪费内存来缓存图片。
                如果在程序中经常需要重用的图片，比如用于UITableView的图片，那么最好是选择imageNamed方法。这种方法可以节省出每次都从磁盘加载图片的时间。
         */
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
