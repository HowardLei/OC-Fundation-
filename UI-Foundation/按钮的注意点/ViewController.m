#import "ViewController.h"
/*
 按钮的注意点
    1、image 的属性可以设置按钮的图片，这样设置的图片跟文字平级。
    2、按钮默认的 type 是 system ，当你进行设置了其他以后就是 custom 。一般我们在使用的时候全都是 custom
    3、设置有 background 的图片都是在文字后边
    4、按钮的状态
        默认是 default：可以设置一套样式
        点击以后就是 highlighted：可以设置一套另外的样式。
        按钮被选中以后的状态是 selected。
        如果按钮被禁用，则状态是 disabled 。
    5、代码创建按钮 如果想要设置不同状态的样式，需要分别进行设置，代码量较大。
 */
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *Wangnima;
@property (weak, nonatomic) IBOutlet UIButton *addWangnimaButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
// MARK: 创建一个 Button ，并且要将 button 里面的方法也写出来。
- (IBAction)createWangnima:(UIButton *)sender {
    // 1、创建一个 Button。
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    // 2、设置文字与图片
    [btn setTitle:@"王尼玛" forState:UIControlStateNormal];
    // 创建图片对象，调用方法 + (nullable UIImage *)imageNamed:(NSString *)name;
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    UIImage *Image = [UIImage imageNamed:@"68e3ec54079dca8e46c5c8d0ef9177c8"];
    [btn setBackgroundImage:Image forState:UIControlStateNormal];
    btn.frame = CGRectMake(145, 44, 124, 121);
    [self.view addSubview:btn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
