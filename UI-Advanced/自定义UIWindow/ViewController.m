//
//  ViewController.m
//  自定义UIWindow
//
//  Created by apple on 2019/3/3.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWindow *redWindow = [[UIWindow alloc] initWithFrame:CGRectMake(0, 35, 200, 200)];
    redWindow.rootViewController = [[UIViewController alloc] init];
    redWindow.backgroundColor = [UIColor redColor];
    redWindow.hidden = NO;
    [self.view addSubview:redWindow];
}

@end
