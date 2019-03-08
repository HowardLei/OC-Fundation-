//
//  ITLoginController.m
//  私人通讯录
//
//  Created by 雷维卡 on 2019/3/7.
//

#import "ITLoginController.h"

@interface ITLoginController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UISwitch *rememberPasswordSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@end

@implementation ITLoginController
// MARK: - 控制控制器 View 当中的生命周期的方法
- (void)viewDidLoad {
    [super viewDidLoad];
    // 注意：由于监听的对象是两个 UITextField 。所以不能通过代理模式来对能否使用登录按钮进行监听。需要通过观察者模式进行监听。其中当前控制器作为控制器的监听者，两个 UITextField 作为通知的发送者。每当 UITextField 有数据改变的时候，就发送通知。
    NSNotificationCenter *center = NSNotificationCenter.defaultCenter;
    [center addObserver:self selector:@selector(contentChange) name:UITextFieldTextDidChangeNotification object:self.userNameTextField];
    [center addObserver:self selector:@selector(contentChange) name:UITextFieldTextDidChangeNotification object:self.passwordTextField];
}
// MARK: - 管理开关的方法
/**
 当点击自动登录开关为开的状态的时候，记住密码的开关同样打开
 @param sender 自动登录开关
 */
- (IBAction)autoLogin:(UISwitch *)sender {
    if (sender.isOn) {
        [self.rememberPasswordSwitch setOn:YES animated:YES];
    }
}
/**
 当记住密码的开关状态为
 @param sender 记住密码开关
 */
- (IBAction)rememberPassword:(UISwitch *)sender {
    if (!sender.isOn) {
        [self.autoLoginSwitch setOn:NO animated:YES];
    }
}
// MARK: - 管理按钮的方法
/**
 当点击登录的时候，执行下面的方法
 @param sender 登录按钮
 */
- (IBAction)login:(UIButton *)sender {
    // 1. 判断用户名密码是否正确
    if ([self.userNameTextField.text isEqualToString:@"admin"] && [self.passwordTextField.text isEqualToString:@"123"]) {
        // 正确的话执行下面的方法
        [self performSegueWithIdentifier:@"login2Contact" sender:nil];
    } else {
        // 错误的话进行提示，
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"密码错误" message:@"请检查一下密码是否有误" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *checkAction = [UIAlertAction actionWithTitle:@"我去检查一下" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.passwordTextField.text = nil;
        }];
        [controller addAction:checkAction];
        [self presentViewController:controller animated:YES completion:nil];
    }
}
// MARK: - 与键盘相关的方法
/**
 当 textField 当中的内容发生改变的时候，系统发送通知。一旦有控制器接受到消息以后，触发这个方法。
 */
- (void)contentChange {
    self.loginButton.enabled = (self.userNameTextField.text.length > 0 && self.passwordTextField.text.length > 0) ? YES : NO;
}
// MARK: - 控制器中的 dealloc 方法
- (void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}
@end
