//
//  ITBlueController.m
//  导航控制器传值
//
//  Created by apple on 2019/3/3.
//

#import "ITBlueController.h"
#import "ITGreenController.h"
@interface ITBlueController ()

@end

@implementation ITBlueController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 100, 100)];
    label.text = _name;
    label.textColor = [UIColor greenColor];
    [self.view addSubview:label];
}
- (IBAction)go2GreenController {
    [self.navigationController pushViewController:[[ITGreenController alloc] init] animated:YES];
}
@end
