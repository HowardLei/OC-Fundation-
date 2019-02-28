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
    [self.navigationController pushViewController:[[ITRedController alloc] init] animated:YES];
}
- (IBAction)touchToGreen {
    [self.navigationController pushViewController:[[ITGreenController alloc] init] animated:YES];
}
- (NSString *)description {
    return [NSString stringWithFormat:@"%@", NSStringFromClass([self class])];
}
@end
