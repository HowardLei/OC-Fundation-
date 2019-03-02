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
    self.navigationItem.title = @"绿色控制器";
}
- (IBAction)touchToBlue {
    if (self.navigationController.viewControllers.count == 3) {
        // 通过调用 popToViewController 方法返回控制器
        for (UIViewController *controller in self.navigationController.viewControllers) {
            if ([controller.description isEqualToString:NSStringFromClass(ITBlueController.class)]) {
                [self.navigationController popToViewController:controller animated:YES];
            }
        }
    } else if (self.navigationController.viewControllers.count == 2) {
        [self.navigationController pushViewController:[[ITBlueController alloc] init] animated:YES];
    } else {
        @throw [NSException exceptionWithName:@"Controller Not Found!" reason:@"栈中寻找不到该控制器" userInfo:nil];
    }
}
- (IBAction)touchToRed {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (NSString *)description {
    return NSStringFromClass(self.class);
}
@end
    
