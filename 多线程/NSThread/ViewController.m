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
    [self demo2];
}
- (void)demo {
    // 1. 通过构造方法创建线程
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    thread.name = @"wangnima";
    thread.threadPriority = 1;
    [thread start];
    // 2. 通过匿名方法创建新线程，并启动该线程的方法
    [NSThread detachNewThreadSelector:@selector(run) toTarget:self withObject:nil];
    // 3. 隐式创建线程
    [self performSelectorInBackground:@selector(run) withObject:nil];
}
/**
 线程的生命周期
 */
- (void)demo2 {
    // 1. 新建线程
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    // 2. 将线程添加到可执行线程池当中，线程变成 runnable 状态
    [thread start];
    // 如果中途没有特殊情况，CPU 会在一个时间点执行该线程。
}
- (void)run {
    NSLog(@"%@", NSThread.currentThread);
    // 3. 中途休眠该线程，使线程进入 block 状态
    [NSThread sleepForTimeInterval:3];
    // 当休眠完成以后，线程将会进入 runnable 状态，等待 CPU 再次调用，进入 running 状态
    // 4. 当需要直接手动杀死当前线程，调用 + (void)exit; 方法
    [NSThread exit];
}
@end
