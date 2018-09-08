#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (IBAction)scroll:(UIButton *)sender {
    // 注意：从属性中的得到的结构体变量不能直接修改
    /*
     原因如下：
        1、首先，从对象中获得结构体的值算是调用对象的 getter 方法。而 getter 方法的返回值属于 R-value。
        2、由于 OC 中点语法属于语法糖的调用方式，在有 setter/getter 方法的情况下，点语法优先调用方法。
     关于 L-value 与 R-value
        在 <The C Programming Language>中写到：an lvalue is an expression referring to an object. 即 lvalue 表达式指的是具体的对象。或者是在单一表达式执行完以后依然存在的对象。而 rvalue 则只是一个值。
        在操作的时候，可以直接对 L-value 进行操作，但是不能对 R-value 进行操作。
     那如何修改结构体中的值？
        创建一个临时变量接受结构体，再对他进行操作。
     */
    CGPoint scrollPoint =  self.scrollView.contentOffset;
    scrollPoint.x += 20;
    scrollPoint.y += 20;
    [self.scrollView setContentOffset:scrollPoint animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.contentSize = self.imageView.image.size;
    // 注意：设置 scrollView 的 Inset 的时候，启动的时候如果没有特别指明，依然还是从图片的左上角开始加载。直到拖动的时候才可以拖动出边框。
    self.scrollView.contentInset = UIEdgeInsetsMake(5, 5, 5, 5);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
