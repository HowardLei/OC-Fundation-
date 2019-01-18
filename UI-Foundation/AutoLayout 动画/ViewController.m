//
//  ViewController.m
//  AutoLayout 动画
//
//  Created by HowardLei on 2019/1/17.
//

#import "ViewController.h"
/*
 在约束中添加动画
 1、将约束的那条线拖到类扩展中（如果是用代码创建的就直接类扩展中写属性）
 2、将需要修改约束的属性修改完成
 3、在继续修改这个属性的值。注意：这里面的值的属性记得看公式（右边条的约束公式）。
 4、添加动画。并且调用需要进行动画的 view 的 layoutIfNeeded 方法。
 5、具体原理查看：https://blog.csdn.net/u013282174/article/details/50247185
 */
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *redViewTopConstraint;
- (IBAction)touchToAnimate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)touchToAnimate {
    self.redViewTopConstraint.constant += 100;
    [UIView animateWithDuration:1.5 animations:^{
        [self.redView layoutIfNeeded];
    }];
}
@end
