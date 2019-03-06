#import "ViewController.h"
/*
 UIKit 坐标系
 控件的坐标是相对坐标，即相对于他的父控件
 */
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIButton *changeFatherViewColor;
@property (weak, nonatomic) IBOutlet UIButton *changeFatherViewColorIntoRandomColor;
@property (weak, nonatomic) IBOutlet UIButton *createView;
@property (weak, nonatomic) IBOutlet UIButton *moveView;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}
// MARK: 改变控件的颜色为指定颜色
- (IBAction)changeFatherViewColor:(UIButton *)sender {
    // 改变父控件的颜色
    self.greenView.backgroundColor = [UIColor greenColor];
}
// MARK: 改变控件的颜色为随机颜色
- (IBAction)changeFatherViewColorIntoRandomColor:(UIButton *)sender {
    // 1、连接按钮所在的父视图
    UIView *fatherView = sender.superview;
    // 2、调整父视图的颜色，让他成为随机色。
    // 注意：在这里面，可以使用 random() 函数，但是编译器有提示，让你使用arc4random 函数，又因为颜色的范围是 0 -- 255, 所以需要调用 arcrandom_uniform() 函数，参数即 255。
    CGFloat randomNumber = arc4random_uniform(255) / 255.0;
    // 3、变成随机色，从 UIColor 中调用方法 + (UIColor *)colorWithRed:(float) 范围：0 -- 1 green:(float) 范围：0 -- 1 blue:(float) 范围：0 -- 1 alpha:透明度 范围0 -- 1 其中0为透明，1为纯正;
    // 因为随机色的范围为 0 -- 1，所以上面求的值需要除以 255.0 才行。（注意：小数不能删，因为结果是 float 型）
    fatherView.backgroundColor = [UIColor colorWithRed:randomNumber green:randomNumber blue:randomNumber alpha:randomNumber];
}
// MARK: 用代码创建一个指定的视图。
- (IBAction)createView:(UIButton *)sender {
    // 1、创建一个新的 View
    UIView *newView = [[UIView alloc] init];
    // 2、对这个视图的属性进行赋值
    CGFloat height = 100;
    CGFloat positionNumber = arc4random_uniform(CGRectGetWidth(UIScreen.mainScreen.bounds) - height);
    newView.frame = CGRectMake(positionNumber, positionNumber, height, height);
    CGFloat randomColor = arc4random_uniform(255) / 255.0;
    newView.backgroundColor = [[UIColor alloc] initWithRed:randomColor green:randomColor blue:randomColor alpha:randomColor];
    // 3、将新视图添加到 UIView 当中
    [self.view addSubview:newView];
}
// MARK: 在这个 GreenView 中创建随机的视图及颜色
// 思路：先创建色块，在对色块的属性进行调整，最后再添加进入视图即可。
- (IBAction)createRandomViewInGreenView:(UIButton *)sender {
    UIView *randomView = [[UIView alloc] initWithFrame:CGRectMake(arc4random_uniform(210), arc4random_uniform(210), 40, 40)];
    randomView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1];
    [_greenView addSubview:randomView];
}
// MARK: 制作色块移动动画
// 思路：先创建一个View，然后修改这个 view 的属性，然后通过 Block 来调用动画。
- (IBAction)moveView:(UIButton *)sender {
    UIView *moveView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, 120, 150)];
    moveView.backgroundColor = [UIColor redColor];
    [self.view addSubview:moveView];
    // 修改里面 view 的属性不能直接修改，需要将这个 CGRect 修改。即将原来的 frame 保存到一个临时变量当中，然后将其中需要修改的属性修改好，再将其修改到里面的 view 当中。
    CGRect oldRect = moveView.frame;
    oldRect.origin.x = 100;
    // UIView 动画 (头尾式动画)
//     先需要写开始 方法：+ (void)beginAnimations:默认为 nil context:默认为 nil;
//    [UIView beginAnimations:nil context:nil];
//    创建完动画后需要设置动画的属性。注意：调用含set前缀的类方法。
//    [UIView setAnimationDelay:2];
//    [UIView setAnimationDuration:3];
//    写完这些以后，把动画需要执行的代码写到这
//    moveView.frame = oldRect;
//    动画结束以后，需要写结束，调用方法：+ (void)commitAnimations;
//    [UIView commitAnimations];
    // UIView 动画 (block 式，一般这么写，容易管理)
    [UIView animateWithDuration:3 animations:^{
        moveView.frame = oldRect;
    }];
}
// MARK: 删除控件
- (IBAction)removeAllViews:(UIButton *)sender {
    // 思路：先进行判断 view 中的所有子空间中的第一个元素有没有，如果有，则将其删除，一直删到没有。
    /*
        UIView *view = self.view.subviews.firstObject;
        while (view != nil) {
        [view removeFromSuperview];
     */
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"注意" message:@"确定清空当前view下的所有控件，此操作无法撤回！" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }];
    [controller addAction:cancelAction];
    [controller addAction:confirmAction];
    [self presentViewController:controller animated:YES completion:nil];
}
@end
