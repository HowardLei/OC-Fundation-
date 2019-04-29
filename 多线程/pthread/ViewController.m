//
//  ViewController.m
//  pthread
//
//  Created by apple on 2019/4/14.
//
#import <pthread.h>
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self demo2];
    NSLog(@"%@", NSThread.currentThread);
}
/**
 无参数创建线程的方法
 */
- (IBAction)showImage:(id)sender {
}
- (void)demo {
    pthread_t threadID;
    int res = pthread_create(&threadID, NULL, target, NULL);
    !res ? NSLog(@"YES") : NSLog(@"NO");
    pthread_detach(threadID);
}
/**
 含参数创建线程的方法
 */
- (void)demo2 {
    pthread_t threadID;
    int res = pthread_create(&threadID, NULL, target, "4312");
    !res ? NSLog(@"YES") : NSLog(@"NO");
    pthread_detach(threadID);
}
/**
 多线程需要调用的函数
 @param param void *参数
 @return void *指针
 */
void *target(void *param) {
    if (param != NULL) {
        NSLog(@"%s", param);
    }
    NSThread *thread = NSThread.currentThread;
    thread.name = @"wangnima";
    NSLog(@"%@", thread);
    return NULL;
}
@end
