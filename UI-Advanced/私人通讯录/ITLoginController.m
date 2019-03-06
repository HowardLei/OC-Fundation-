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

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
