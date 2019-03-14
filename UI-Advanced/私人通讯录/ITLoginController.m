//
//  ITLoginController.m
//  私人通讯录
//
//  Created by 雷维卡 on 2019/3/7.
//

#import "ITLoginController.h"
#import "MBProgressHUD/MBProgressHUD+CZ.h"
#import "ITContactController.h"
#import "ITContact.h"
@interface ITLoginController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UISwitch *rememberPasswordSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *passcode;
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
 当点击自动登录开关为开的状态的时候，记住密码的开关同样打开。而且下次重新打开应用的时候，可以直接将密码直接导入。
 @param sender 自动登录开关
 */
- (IBAction)autoLogin:(UISwitch *)sender {
    if (sender.isOn) {
        [self.rememberPasswordSwitch setOn:YES animated:YES];
        [self rememberPassword:self.rememberPasswordSwitch];
    }
}
/**
 当点击记住密码开关的时候，执行下面的方法。
 @param sender 记住密码开关
 */
- (IBAction)rememberPassword:(UISwitch *)sender {
    if (!sender.isOn) {
        [self.autoLoginSwitch setOn:NO animated:YES];
    } else {
        self.userName = self.userNameTextField.text;
        self.passcode = self.passwordTextField.text;
    }
}
// MARK: - 管理按钮的方法
/**
 当点击登录的时候，执行下面的方法
 @param sender 登录按钮
 */
- (IBAction)login:(UIButton *)sender {
    // 模拟网络登录
    [MBProgressHUD showMessage:@"正在登录" toView:self.navigationController.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
        // 1. 判断用户名密码是否正确
        if ([self.userNameTextField.text isEqualToString:@"admin"] && [self.passwordTextField.text isEqualToString:@"123"]) {
            // 正确的话执行下面的方法，进行页面的跳转
            [self performSegueWithIdentifier:@"login2Contact" sender:@"admin"];
        } else {
            // 错误的话进行提示。并且清空密码框
            [MBProgressHUD showError:@"您输入的密码有误"];
            self.passwordTextField.text = nil;
        }
    });
}
// MARK: - 与键盘相关的方法
/**
 当 textField 当中的内容发生改变的时候，系统发送通知。一旦有控制器接受到消息以后，触发这个方法。
 */
- (void)contentChange {
    self.loginButton.enabled = (self.userNameTextField.text.length > 0 && self.passwordTextField.text.length > 0) ? YES : NO;
}
/**
 当输入完密码以后，点击完成即可登录
 @param textField 输入密码的文本框
 @return 默认为 YES
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self login:self.loginButton];
    return YES;
}
// MARK: - 控制器中的 dealloc 方法
- (void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}
// MARK: - 控制 segue 方法
/**
 当我们需要通过 segue 的时候，需要进行顺向传值。
 @param segue 需要通过的 segue
 @param sender 需要顺向传递的值
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ITContactController *controller = segue.destinationViewController;
    controller.navigationItem.title = [NSString stringWithFormat:@"%@的私人通讯录", sender];
}
@end
