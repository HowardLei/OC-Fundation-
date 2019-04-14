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
    [self demo];
    NSLog(@"%@", NSThread.currentThread);
}
/**
 无参数创建线程的方法
 */
- (void)demo {
    pthread_t threadID;
    int res = pthread_create(&threadID, NULL, targat, NULL);
    !res ? NSLog(@"YES") : NSLog(@"NO");
}
/**
 含参数创建线程的方法
 */
- (void)demo2 {
    pthread_t threadID;
    int res = pthread_create(&threadID, NULL, targat, "4312");
    !res ? NSLog(@"YES") : NSLog(@"NO");
}
/**
 多线程需要调用的函数
 @param param void *参数
 @return void *指针
 */
void *targat(void *param) {
    NSLog(@"%@", NSThread.currentThread);
    return NULL;
}
@end
