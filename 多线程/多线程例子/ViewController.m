//
//  ViewController.m
//  多线程例子
//
//  Created by 雷维卡 on 2019/1/19.
//

#import "ViewController.h"
#import "MyThread.h"
#define MAXSIZE 100000
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    @try {
        MyThread *thread1 = [[MyThread alloc] initWithTarget:self selector:@selector(runWithNumber:) object:@1];
        MyThread *thread2 = [[MyThread alloc] initWithTarget:self selector:@selector(runWithNumber:) object:@2];
        MyThread *thread3 = [[MyThread alloc] initWithTarget:self selector:@selector(runWithNumber:) object:[NSNumber numberWithInt:MAXSIZE + 1]];
        [thread1 start];
        [thread2 start];
        [thread3 start];
    } @catch (NSException *exception) {
        for (NSString *errorInfo in exception.userInfo) {
            NSLog(@"%@:%@", errorInfo, exception.userInfo[errorInfo]);
        }
    }
}

- (void)runWithNumber:(NSNumber *)number {
    int value = number.intValue;
    if (value < MAXSIZE) {
        for (int i = value; i < MAXSIZE; i += 2) {
            NSLog(@"%d为初值创建的线程执行到:%d", value, i);
        }
    } else {
        @throw [NSException exceptionWithName:@"线程创建失败" reason:@"所执行的数超出线程体的执行范围" userInfo:nil];
    }
}
@end
