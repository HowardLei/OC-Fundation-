#import "ViewController.h"
/*
 UIImageView 的帧动画。
 在 ImageView 中，我们可以将一些图片拼接起来，做成帧动画。
 思路：先创建一个数组，用来保存图片，再将这些图片添加到数组中，再将数组赋给 imageView 对象的 animationImages 属性中，再将控制其动画的时间（imageView 对象的 animationDuration 属性）以及循环次数（imageView 对象的 animationRepeatCount 属性）
 */
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tom;
@property (weak, nonatomic) IBOutlet UIButton *drinkButton;
@property (weak, nonatomic) IBOutlet UIButton *eatButton;
@property (weak, nonatomic) IBOutlet UIButton *fartButton;
@property (weak, nonatomic) IBOutlet UIButton *pieButton;
@property (weak, nonatomic) IBOutlet UIButton *scratchButton;
@property (weak, nonatomic) IBOutlet UIButton *cymbalButton;
@property (weak, nonatomic) IBOutlet UIButton *knockOutButton;

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
    [self action:@"drink" InDuration:3 RepeatCount:1];
}
// 吃东西按钮
- (IBAction)eat:(UIButton *)sender {
    [self action:@"eat" InDuration:3 RepeatCount:1];
}
// MARK: 放屁
- (IBAction)fart:(UIButton *)sender {
    [self action:@"fart" InDuration:3 RepeatCount:1];
}
// MARK: 吃派
- (IBAction)eatPie:(UIButton *)sender {
    [self action:@"pie" InDuration:2.2 RepeatCount:1];
}
// MARK: 抓屏幕
- (IBAction)scratchTheScreen:(UIButton *)sender {
    [self action:@"scratch" InDuration:5 RepeatCount:1];
}
// MARK: 打鼓
- (IBAction)cymbal:(UIButton *)sender {
    [self action:@"cymbal" InDuration:1.8 RepeatCount:1];
}
// MARK: 击倒
- (IBAction)knockOut:(UIButton *)sender {
    [self action:@"knockout" InDuration:5 RepeatCount:1];
}
// MARK: 动画汇总方法
- (void)action:(NSString *)action InDuration:(NSTimeInterval) duration RepeatCount:(int) count{
    // 注意：由于在触发了一个动画的时候，不能触发其他的动画，所以说需要进行一个判断，如果动画正在进行，则不能再进行其他的动画。
    if (self.tom.animating) {
        return;
    }
    NSMutableArray *arrM = [NSMutableArray array];
    int i = 0;
    NSFileManager *manager = [NSFileManager defaultManager];
    // 由于我们不知道需要调用多少动画，所以需要使用 while 循环进行判断
    while ([manager fileExistsAtPath:myBlock(action, i)]) {
        /*
         注意：对于 imageNamed 方法与 imageWithContentsOfFile 的选择
            1、如果选择 imageNamed 方法的话，就会首先在系统缓存中根据指定的名字寻找图片,如果找到了就返回。如果没有在缓存中找到图片,该方法会从指定的文件中加载图片数据,并将其缓存起来,然后再把结果返回,下次再使用该名称图片的时候就 省去了从硬盘中加载图片的过程。对于相同名称的图片,系统只会把它Cache到内存一次。
            2、如果选择 imageWithContentsOfFile 方法的话，只是简单的加载图片,并不会将图片缓存起来,图像会被系统以数据方式加载到程序。当你不需要重用该图像,或者你需要将图像以数据方式存储到数据库,又或者你要通过网络下载一个很大的图像时,可以使用这种方式。
            3、如何选择
                如果加载一张很大的图片,并且只使用一次,那么就不需要缓存这个图片。这种情况imageWithContentsOfFile比较合适——系统不会浪费内存来缓存图片。
                如果在程序中经常需要重用的图片，比如用于UITableView的图片，那么最好是选择imageNamed方法。这种方法可以节省出每次都从磁盘加载图片的时间。
         */
        // 注意：如果调用 imageWithContentsOfFile 方法时，添加文件不能添加到 Assets.xcassets 文件夹中，应该直接添加到项目当中。而且添加的时候应该选择 create groups ，才能调用这个方法。而调用 imageNamed 方法的时候，则可以添加到 Assets.xcassets 中。
        UIImage *tempImage = [UIImage imageWithContentsOfFile:myBlock(action, i)];
        [arrM addObject:tempImage];
        i++;
    }
    self.tom.animationImages = arrM;
    self.tom.animationRepeatCount = count;
    self.tom.animationDuration = duration;
    [self.tom startAnimating];
    [self performSelector:@selector(delete) withObject:nil afterDelay:duration + 1];
}
// MARK: 清除 animationImages 属性里面的内存
- (void)delete {
    self.tom.animationImages = nil;
}
@end
