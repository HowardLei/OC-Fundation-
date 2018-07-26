#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str1 = @"王尼玛";
    NSString *str2 = [str1 copy];
    NSLog(@"str1.retainCount = %lu", str1.retainCount);
    NSLog(@"str1 = %@, str2 = %@", str1, str2);
    NSLog(@"str1 = %p, str2 = %p", str1, str2);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
