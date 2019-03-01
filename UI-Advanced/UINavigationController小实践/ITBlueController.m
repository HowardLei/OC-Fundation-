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
}
- (IBAction)touchToRed {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)touchToGreen {
    if (self.navigationController.viewControllers.count == 3) {
        NSArray<UIViewController *> *controllers = [self.navigationController popToViewController:[[ITRedController alloc] init] animated:YES];
        for (UIViewController *controller in controllers) {
            NSLog(@"%@", controller);
        }
        [self.navigationController popViewControllerAnimated:YES];
    } else if (self.navigationController.viewControllers.count == 2) {
        [self.navigationController pushViewController:[[ITGreenController alloc] init] animated:YES];
    } else {
        @throw [NSException exceptionWithName:@"string" reason:@"string" userInfo:nil];
    }
}
@end
