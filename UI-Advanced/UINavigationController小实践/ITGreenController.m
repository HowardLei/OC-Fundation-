//
//  ITGreenController.m
//  UINavigationController小实践
//
//  Created by apple on 2019/2/28.
//

#import "ITGreenController.h"
#import "ITBlueController.h"
#import "ITRedController.h"
@interface ITGreenController ()

@end

@implementation ITGreenController
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)touchToBlue {
    if (self.navigationController.viewControllers.count == 3) {
        [self.navigationController popViewControllerAnimated:YES];
    } else if (self.navigationController.viewControllers.count == 2) {
        [self.navigationController pushViewController:[[ITBlueController alloc] init] animated:YES];
    } else {
        @throw [NSException exceptionWithName:@"Controller Not Found!" reason:@"栈中寻找不到该控制器" userInfo:nil];
    }
}
- (IBAction)touchToRed {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
    
