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
    // FIXME: 为什么在根控制器下设置不了导航栏左边的按键？
    self.navigationItem.leftBarButtonItem = add;
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
