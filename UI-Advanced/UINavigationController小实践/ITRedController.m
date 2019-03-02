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
