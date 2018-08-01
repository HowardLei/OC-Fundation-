#import "ViewController.h"
/*
 如何对 view 里面的控件的位置进行操作？ 用 transform 属性
 如何调用 transform 属性？ 在 button 控件下有个属性。
 1、控件的旋转
 // 连续进行旋转（注意：第一个参数为 CGAffineTransform 结构体，第二个参数为旋转角度（弧度制），顺时针为正，逆时针为负）
    CGAffineTransformRotate(CGAffineTransform t, CGF loat angle)
        补充：弧度的宏为 M_PI 在 math.h 中可以找到。
 // 只旋转一次的方法（旋转的弧度）
    CGAffineTransformMakeRotation(CGFloat angle)
 2、控件的缩放
 // 连续对图片进行缩放（第一个参数为控件的 transform 属性，第二、三个参数是缩放的倍数，注意：不能写 0 ，否则图片会消失）
    CGAffineTransformScale(CGAffineTransform t, CGFloat sx, CGFloat sy)
 // 对图片进行一次缩放（与上边的相同）
    CGAffineTransformMakeScale(CGFloat sx, CGFloat sy)
 3、控件的平移
 // 对控件的连续平移（第一个参数为控件的 transform 属性，第二、三个参数是平移的距离，右下为正，左上为负）
    CGAffineTransformTranslate(CGAffineTransform t, CGFloat tx, CGFloat ty)
 // 对控件的单次平移（参数与上边相同）
    CGAffineTransformMakeTranslation(CGFloat tx, CGFloat ty)
 4、恢复控件原始位置
    控件.transform = CGAffineTransformIdentity
 */
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *wangnima;
@property (weak, nonatomic) IBOutlet UIButton *rotateButton;
@property (weak, nonatomic) IBOutlet UIButton *trasitionButton;
@property (weak, nonatomic) IBOutlet UIButton *scaleButton;
@property (weak, nonatomic) IBOutlet UIButton *restoreButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
// MARK: 图片的旋转
- (IBAction)rotate:(UIButton *)sender {
    self.wangnima.transform = CGAffineTransformRotate(self.wangnima.transform, M_PI_4);
}
// MARK: 图片的缩放
- (IBAction)scale:(UIButton *)sender {
    self.wangnima.transform = CGAffineTransformScale(self.wangnima.transform, 1.2, 1.2);
}
// MARK: 图片的平移
- (IBAction)transition:(UIButton *)sender {
    self.wangnima.transform = CGAffineTransformTranslate(self.wangnima.transform, 0, 20);
}
-(IBAction)restore:(UIButton *)sender {
    self.wangnima.transform = CGAffineTransformIdentity;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
