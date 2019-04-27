//
//  ITTabBarController.m
//  通过StoryBoard创建UITabBarController
//
//  Created by apple on 2019/4/25.
//

#import "ITTabBarController.h"

@interface ITTabBarController ()

@end

@implementation ITTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.tintColor = [UIColor redColor];
}
/**
 当点击了 Tab Bar Item 的时候，执行下面的方法
 @param tabBar 遵守协议的 Tab bar
 @param item 用户点击的选项
 */
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    // 注意：在这个方法中，不能获取选择的控制器及选择的下标。因为当这个方法执行的时候，无法更新选择的控制器以及下标。（这是协议当中的方法）如果想获得下标，只能通过 item 的 tag 值来进行判断
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"哈哈哈" message:[NSString stringWithFormat:@"你选中了第%lu个控制器", item.tag] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil];
    [controller addAction:action];
    [self presentViewController:controller animated:YES completion:nil];
}
@end
