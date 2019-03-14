//
//  ITEditController.m
//  私人通讯录
//
//  Created by apple on 2019/3/13.
//

#import "ITEditController.h"
#import "ITContactController.h"
@interface ITEditController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@end

@implementation ITEditController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameTextField.text = self.contact.name;
    self.phoneTextField.text = self.contact.phoneNumber;
}
- (IBAction)edit:(UIBarButtonItem *)sender {
    if (!([self.nameTextField.text isEqualToString:self.contact.name] && [self.phoneTextField.text isEqualToString:self.contact.phoneNumber])) {
        ITContact *contact = [ITContact contactWithName:self.nameTextField.text phoneNumber:self.phoneTextField.text];
        if ([self.delegate respondsToSelector:@selector(editCellContent:)]) {
            [self.delegate editCellContent:contact];
        }
    }
    [self.navigationController popViewControllerAnimated:YES];
}
@end
