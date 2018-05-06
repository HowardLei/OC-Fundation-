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
    Car *a = [[Tesla alloc] init];
    Car *b = [[Trunk alloc] init];
    a.speed = 180.0;
    b.speed = 100.2;
    double s = [a compareSpeed:a.speed withSpeed:b.speed];
    NSLog(@"%@和%@的速度差为%g", a, b, s);
    Class tesla = [Car class];
    Class trunk = [Car class];
    // FIXME: 不知道类对象中的成员变量如何添加
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        car();
    }
    return 0;
}
