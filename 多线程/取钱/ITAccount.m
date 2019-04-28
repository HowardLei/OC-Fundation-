//
//  ITAccount.m
//  取钱
//
//  Created by 雷维卡 on 2019/4/28.
//

#import "ITAccount.h"

@implementation ITAccount
- (instancetype)initWithAccount:(NSString *)acccountNO balance:(double)balance {
    self = [super init];
    if (self) {
        _accountNO = acccountNO;
        _balance = balance;
        _locker = [[NSLock alloc] init];
    }
    return self;
}
- (void)drawAmount:(CGFloat)amount {
    /*
     同步锁
     格式：@synchronized (需要上锁的对象) {
            需要锁定的代码（同步代码块）
        }
    */
    // 将当前账户作为同步锁，如果哪个人需要取钱，需要先将当前账户锁定，防止其它账户能够并发访问到当前账户。
    @synchronized (self) {
        // 通过判断卡里面的余额，来决定能否取钱
        if (self.balance >= amount) {
            NSLog(@"%@取钱成功！取出现金%g元", NSThread.currentThread.name, amount);
            self.balance -= amount;
            [NSThread sleepForTimeInterval:0.2];
            NSLog(@"现在还剩%g", self.balance);
        } else {
            NSLog(@"对不起，从%@取钱失败，无法取钱", NSThread.currentThread.name);
        }
    }
    // 当取钱结束以后，即解除同步锁。
}
@end
