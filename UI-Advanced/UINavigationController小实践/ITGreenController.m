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
    [self.navigationController pushViewController:[[ITBlueController alloc] init] animated:YES];
}
- (IBAction)touchToRed {
    if (self.navigationController.viewControllers.count == 3) {
        [self.navigationController popToViewController:[[ITRedController alloc] init] animated:YES];
    } else if (self.navigationController.viewControllers.count == 2) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        @throw [NSException exceptionWithName:@"弹出窗口异常" reason:@"UINavigationController栈中没有红色控制器" userInfo:nil];
    }
}
- (NSString *)description {
    return [NSString stringWithFormat:@"%@", NSStringFromClass([self class])];
}
@end
