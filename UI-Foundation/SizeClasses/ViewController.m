//
//  ViewController.m
//  SizeClasses
//
//  Created by 雷维卡 on 2019/1/21.
//

#import "ViewController.h"
/*
 Size classes
 1、出现情况：随着屏幕种类的不断发展，需要适配的屏幕越来越多。为了解决这个问题，需要屏幕进行分类适配。
 2、Size Classes 分为 3 种格式：
    C compact : 紧凑型；
    R regular : 宽松型；
    Any 任意类型
 */
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)loginIn:(UIButton *)sender {
    // 判断键盘中是否具有内容，如果没有则弹出一个警告栏
    if ([self.userNameTextField.text isEqualToString:@""] ||
        [self.passwordTextField.text isEqualToString:@""]) {
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"输入格式错误" message:@"你的用户名和密码是不是没有填完啊？" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"让我重新检查一下" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"我要重新输入一遍" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            self.userNameTextField.text = nil;
            self.passwordTextField.text = nil;
        }];
        [controller addAction:action1];
        [controller addAction:action2];
        [self presentViewController:controller animated:YES completion:nil];
    }
}
@end
