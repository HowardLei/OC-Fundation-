//
//  ITViewController.m
//  UITabBarController基本原理
//
//  Created by apple on 2019/4/24.
//

#import "ITViewController.h"

@interface ITViewController ()

@end

@implementation ITViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (instancetype)initWithBackgroundColor:(UIColor *)backgroundColor {
    self = [super init];
    if (self) {
        self.view.backgroundColor = backgroundColor;
    }
    return self;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
