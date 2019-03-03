//
//  ITRedController.m
//  UINavigationController小实践
//
//  Created by apple on 2019/2/28.
//

#import "ITRedController.h"
#import "ITBlueController.h"
#import "ITGreenController.h"

@interface ITRedController ()

@end

@implementation ITRedController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"红色控制器";
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    UIBarButtonItem *camera = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:nil];
    NSArray<UIBarButtonItem *> *buttons = @[add, camera];
    // 注意：这个地方不能将左边和右边的按钮设置成相同对象，否则会出现一侧添加不上。（可以再次创建一个匿名对象解决）
//    self.navigationItem.leftBarButtonItem = add;
    self.navigationItem.rightBarButtonItems = buttons;
}
- (IBAction)touchToGreen {
    [self.navigationController pushViewController:[[ITGreenController alloc] init] animated:YES];
}
- (IBAction)touchToBlue {
    [self.navigationController pushViewController:[[ITBlueController alloc] init] animated:YES];
}
- (NSString *)description {
    return NSStringFromClass(self.class);
}
@end
