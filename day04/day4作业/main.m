#import <Foundation/Foundation.h>
#import "Car.h"
#import "Tesla.h"
#import "Trunk.h"
// MARK: 设计car类
void car(){
    /*
     需求：
     1> 属性
     * 速度

     2> 方法
     * 属性相应的set和get方法
     * 一个对象方法跟其他车子比较车速，返回速度差
     * 一个类方法比较两辆车的车速，返回速度差
     */
    Car *a = [[Trunk alloc] init];
    Car *b = [[Tesla alloc] init];
    a.speed = 122.23;
    b.speed = 180;
    Class c = [Car class];
    NSLog(@"%@与%@之间的车速相差%g", a, b, [a compareSpeedWithOtherCar:b]);
    NSLog(@"%g", [c compareCar:a WithCar:b]);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        car();
    }
    return 0;
}
