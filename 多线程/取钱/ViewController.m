//
//  ViewController.m
//  取钱
//
//  Created by apple on 2019/4/27.
//

#import "ViewController.h"
#import "ITAccount.h"
@interface ViewController ()
@property (nonatomic, strong) ITAccount *account;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.account = [[ITAccount alloc] initWithAccount:@"123456" balance:1000];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(10, 50, CGRectGetWidth(self.view.bounds) - 20, 30);
    [button setTitle:@"并发编程" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(draw:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)draw:(UIButton *)sender{
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(drawMethod:) object:@800];
    thread1.name = @"中国银行";
    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(drawMethod:) object:@800];
    thread2.name = @"中国工商银行";
    [thread1 start];
    [thread2 start];
}
- (void)drawMethod:(NSNumber *)drawAmount {
    [self.account drawAmount:drawAmount.doubleValue];
}
@end
