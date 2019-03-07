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
// MARK: - 控制 View 当中的生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    NSNotificationCenter *center = NSNotificationCenter.defaultCenter;
    [center addObserver:self selector:@selector(contentChange:) name:UITextFieldTextDidChangeNotification object:self.userNameTextField];
    [center addObserver:self selector:@selector(contentChange:) name:UITextFieldTextDidChangeNotification object:self.passwordTextField];
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
// MARK: - 与键盘相关的方法
/**
 当 textField 当中的内容发生改变的时候，
 @param textField 需要检测的 textField
 */
- (void)contentChange:(UITextField *)textField {
    // 1. 先判断发送通知的键盘是哪一个
    if ([textField.description isEqualToString:self.userNameTextField.description]) {
        
    }
}
@end
