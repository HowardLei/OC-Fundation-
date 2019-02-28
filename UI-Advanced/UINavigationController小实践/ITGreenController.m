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
    
}
- (NSString *)description {
    return [NSString stringWithFormat:@"%@", NSStringFromClass([self class])];
}
@end
