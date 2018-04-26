#import <Foundation/Foundation.h>
#import "Son.h"
/*
 关键字 super
 1、本意：调用父类方法
 2、应用场景
    (1)、在对象方法中，调用父类的对象方法
    (2)、在类方法中，调用类的父类的类方法
 3、调用顺序：先看本类的直接父类有没有这个方法，如果有就按照父类的实现，如果直接父类没有，则依次看父类的父类，直到NSObject。
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Son * son = [[Son alloc] init];
        [son eat];
        [son run];
    }
    return 0;
}
