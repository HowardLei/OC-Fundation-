//
//  ITRedController.m
//  导航控制器传值
//
//  Created by apple on 2019/3/3.
//

#import "ITRedController.h"
#import "ITBlueController.h"
@interface ITRedController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation ITRedController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)go2BlueController:(id)sender {
    ITBlueController *blueController = [[ITBlueController alloc] init];
    blueController.name = self.textField.text;
    [self.navigationController pushViewController:blueController animated:YES];
}
@end
