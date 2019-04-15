//
//  ViewController.m
//  NSThread
//
//  Created by apple on 2019/4/15.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self demo];
}
- (void)demo {
    // 1. 通过构造方法创建线程
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    thread.name = @"wangnima";
    [thread start];
    // 2. 通过匿名方法创建新线程，并启动该线程的方法
    [NSThread detachNewThreadSelector:@selector(run) toTarget:self withObject:nil];
    // 3. 隐式创建线程
    [self performSelectorInBackground:@selector(run) withObject:nil];
}
- (void)run {
    NSLog(@"%@", NSThread.currentThread);
}
@end
