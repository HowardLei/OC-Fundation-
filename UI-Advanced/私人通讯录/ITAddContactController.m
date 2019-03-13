//
//  ITAddContactController.m
//  私人通讯录
//
//  Created by apple on 2019/3/8.
//

#import "ITAddContactController.h"
#import "ITContactController.h"
#import "ITContact.h"
@interface ITAddContactController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@end

@implementation ITAddContactController
// MARK: - 与试图有关的方法
- (void)viewDidLoad {
    [super viewDidLoad];
    NSNotificationCenter *center = NSNotificationCenter.defaultCenter;
    [center addObserver:self selector:@selector(doneButtonEnable) name:UITextFieldTextDidChangeNotification object:self.nameTextField];
    [center addObserver:self selector:@selector(doneButtonEnable) name:UITextFieldTextDidChangeNotification object:self.phoneTextField];
}
// MARK: - 按钮业务
/**
 点击完成按钮以后，返回原有控制器
 */
- (IBAction)done {
    for (id controller in self.navigationController.viewControllers) {
        if ([controller isMemberOfClass:ITContactController.class]) {
            ITContact *person = [ITContact contactWithName:self.nameTextField.text phoneNumber:self.phoneTextField.text];
            [[controller contacts] addObject:person];
            [[controller tableView] reloadData];
            [self.navigationController popToViewController:controller animated:YES];
            return;
        }
    }
}
/**
 当文本框当中都有数据的时候，才让按钮能够正常使用
 */
- (void)doneButtonEnable {
    self.doneButton.enabled = self.nameTextField.text.length > 0 && self.phoneTextField.text.length > 0 ? YES : NO;
}
/**
 当点击键盘当中的完成的时候，自动选择完成
 @param textField 输入密码的文本框
 @return 默认为 YES
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self done];
    return YES;
}
// MARK: - dealloc Method
// 当你创建好通知的时候，千万不要忘记移除通知
- (void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}
@end
