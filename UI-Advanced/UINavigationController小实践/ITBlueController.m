//
//  ITBlueController.m
//  UINavigationController小实践
//
//  Created by apple on 2019/2/28.
//

#import "ITBlueController.h"
#import "ITRedController.h"
#import "ITGreenController.h"

@interface ITBlueController ()

@end

@implementation ITBlueController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"蓝色控制器";
}
- (IBAction)go2GreenController {
}
- (IBAction)go2GreenController:(id)sender {
}
- (IBAction)touchToRed {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)touchToGreen {
    if (self.navigationController.viewControllers.count == 3) {
        [self.navigationController popViewControllerAnimated:YES];
    } else if (self.navigationController.viewControllers.count == 2) {
        [self.navigationController pushViewController:[[ITGreenController alloc] init] animated:YES];
    } else {
        @throw [NSException exceptionWithName:@"Controller Not Found" reason:@"栈中寻找不到该控制器" userInfo:nil];
    }
}
- (NSString *)description {
    return NSStringFromClass(self.class);
}
@end
