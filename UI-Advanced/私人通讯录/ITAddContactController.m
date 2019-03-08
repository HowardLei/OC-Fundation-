//
//  ITAddContactController.m
//  私人通讯录
//
//  Created by apple on 2019/3/8.
//

#import "ITAddContactController.h"
#import "ITContactController.h"
#import "ITContact.h"
@interface ITAddContactController ()
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
// MARK: 按钮业务
/**
 点击完成按钮以后，返回原有控制器
 */
- (IBAction)done {
    for (id controller in self.navigationController.viewControllers) {
        if ([controller isMemberOfClass:ITContactController.class]) {
            ITContact *person = [[ITContact alloc] init];
            person.name = self.nameTextField.text;
            person.phoneNumber = self.phoneTextField.text;
            [controller setContact:person];
            // FIXME: 当调用刷新方法的时候，无法刷新出界面
            [[controller tableView] reloadData];
            [self performSelector:@selector(delayMethodWithController:) withObject:controller afterDelay:0.01];
            return;
        }
    }
}
- (void)doneButtonEnable {
    self.doneButton.enabled = self.nameTextField.text.length > 0 && self.phoneTextField.text.length > 0 ? YES : NO;
}
// 单纯的封装方法，减少参数
- (void)delayMethodWithController:(UITableViewController *)controller {
    [self.navigationController popToViewController:controller animated:YES];
}
@end
