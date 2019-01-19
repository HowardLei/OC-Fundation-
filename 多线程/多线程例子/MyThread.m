//
//  MyThread.m
//  多线程例子
//
//  Created by 雷维卡 on 2019/1/19.
//

#import "MyThread.h"

@implementation MyThread
- (instancetype)initWithTarget:(id)target selector:(SEL)selector object:(id)argument {
    self = [super initWithTarget:target selector:selector object:argument];
    if (self) {
        self.name = [argument intValue] % 2 == 0 ? @"偶数线程" : @"奇数线程";
    }
    return self;
}
@end
