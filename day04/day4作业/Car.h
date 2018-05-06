#import <Foundation/Foundation.h>

@interface Car : NSObject
@property double speed;
// MARK: 一个对象方法跟其他车子比较车速，返回速度差
- (double)compareSpeedWithOtherCar:(Car *)car;
// MARK: 一个类方法比较两辆车的车速，返回速度差
+ (double)compareCar:(Car *)car1 WithCar:(Car *)car2;
@end
