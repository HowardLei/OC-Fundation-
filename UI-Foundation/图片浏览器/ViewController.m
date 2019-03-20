#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (strong, nonatomic) NSArray<NSDictionary *> *arr;
// 创建一个索引属性，控制其是第几张图片。
@property (assign, nonatomic) int index;

@end

@implementation ViewController
// MARK: ViewController 中的 View 加载完毕以后执行的方法。
- (void)viewDidLoad {
    [super viewDidLoad];
    // 由于程序启动的时候并没有进行，显示的时候并没有图片，所以先调用 setData 方法，相当与先点击一下下一张的按钮
    [self setData];
}
// MARK: 懒加载数据（直到调用 getter 方法才将数据传输进内存）
- (NSArray<NSDictionary *> *)arr {
    if (_arr == nil) {
        // NSBundle 是一个目录，其中包含了程序会使用到的资源。初始化的方法为 [NSBundle mainBundle] 。他会调用 App 的根目录。
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Picture" ofType:@".plist"];
        NSArray<NSDictionary *> *tempArr = [NSArray arrayWithContentsOfFile:path];
        _arr = tempArr;
    }
    return _arr;
}
// MARK: 下一张图片按钮
- (IBAction)nextPicture:(UIButton *)sender {
    // 1、先让索引 ++
    self.index++;
    [self setData];
}
// MARK: 上一张图片的按钮
- (IBAction)backPicture:(UIButton *)sender {
    self.index--;
    [self setData];
}
// MARK: 封装代码，因为控制上一张与下一张的代码基本上相同，所以将相同的部分写成方法进行封装，再统一进行调用即可。
- (void)setData {
    // 2、从数组中获取当前这张图片的数据
    NSDictionary *dict = self.arr[self.index];
    // 3、把从数组上获取的数据设置到界面的控件
    self.numberLabel.text = [NSString stringWithFormat:@"%d/%ld", self.index + 1, self.arr.count];
    // 设置图片
    self.imageView.image = [UIImage imageNamed:dict[@"name"]];
    // 设置图片的描述
    self.descriptionLabel.text = dict[@"description"];
    // 根据 index 数来判断这两个按钮是否可以使用。如果 index 的数等于 数组的数组，则按钮状态变为 disabled 。
    self.rightButton.enabled = (self.index != (self.arr.count - 1));
    self.leftButton.enabled = (self.index != 0);
}
@end
