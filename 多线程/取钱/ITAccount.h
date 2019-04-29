//
//  ITAccount.h
//  取钱
//
//  Created by 雷维卡 on 2019/4/28.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>
NS_ASSUME_NONNULL_BEGIN

@interface ITAccount : NSObject
@property (nonatomic, copy, readonly) NSString *accountNO;
@property (nonatomic, assign) CGFloat balance;
// 如果需要显式保证当前对象的线程安全，需要创建一个 NSLock 类的对象来控制锁。
@property (nonatomic, strong) NSLock *locker;
- (instancetype)initWithAccount:(NSString *)acccountNO balance:(CGFloat)balance;
/**
 从卡里取钱
 @param amount 需要取多少钱
 */
- (void)drawAmount:(double)amount;
@end

NS_ASSUME_NONNULL_END
