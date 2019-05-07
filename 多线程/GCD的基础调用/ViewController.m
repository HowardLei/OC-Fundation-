//
//  ViewController.m
//  GCD的基础调用
//
//  Created by 雷维卡 on 2019/4/30.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self syncMainThread];
}
/**
 同步执行+并行队列
 */
- (void)syncConcurrent {
    dispatch_queue_t queue = dispatch_queue_create(NULL, DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(queue, ^{
        NSLog(@"1%@", NSThread.currentThread);
    });
    dispatch_sync(queue, ^{
        NSLog(@"2%@", NSThread.currentThread);
    });
    dispatch_sync(queue, ^{
        NSLog(@"3%@", NSThread.currentThread);
    });
    dispatch_sync(queue, ^{
        NSLog(@"4%@", NSThread.currentThread);
    });
}
/**
 同步执行+串行队列
 */
- (void)syncSerial {
    dispatch_queue_t queue = dispatch_queue_create(NULL, DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        NSLog(@"1%@", NSThread.currentThread);
    });
    dispatch_sync(queue, ^{
        NSLog(@"2%@", NSThread.currentThread);
    });
    dispatch_sync(queue, ^{
        NSLog(@"3%@", NSThread.currentThread);
    });
    dispatch_sync(queue, ^{
        NSLog(@"4%@", NSThread.currentThread);
    });
}
/**
 异步执行+串行队列
 */
- (void)asyncSerial {
    dispatch_queue_t queue = dispatch_queue_create(NULL, DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"1%@", NSThread.currentThread);
    });
    dispatch_async(queue, ^{
        NSLog(@"2%@", NSThread.currentThread);
    });
    dispatch_async(queue, ^{
        NSLog(@"3%@", NSThread.currentThread);
    });
    dispatch_async(queue, ^{
        NSLog(@"4%@", NSThread.currentThread);
    });
}
/**
 异步执行+并行队列
 */
- (void)asyncConcurrent {
    dispatch_queue_t queue = dispatch_queue_create(NULL, DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"1%@", NSThread.currentThread);
    });
    dispatch_async(queue, ^{
        NSLog(@"2%@", NSThread.currentThread);
    });
    dispatch_async(queue, ^{
        NSLog(@"3%@", NSThread.currentThread);
    });
    dispatch_async(queue, ^{
        NSLog(@"4%@", NSThread.currentThread);
    });
}
/**
 同步执行+主队列
 */
- (void)syncMainThread {
    dispatch_queue_main_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        NSLog(@"1%@", NSThread.currentThread);
    });
    dispatch_sync(queue, ^{
        NSLog(@"2%@", NSThread.currentThread);
    });
    dispatch_sync(queue, ^{
        NSLog(@"3%@", NSThread.currentThread);
    });
    dispatch_sync(queue, ^{
        NSLog(@"4%@", NSThread.currentThread);
    });
}
- (void)asyncMainThread {

}
@end
