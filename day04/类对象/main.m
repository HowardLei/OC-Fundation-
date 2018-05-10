#import <Foundation/Foundation.h>
#import "Person.h"
/*
 类对象
 注意：类在内存当中也是以对象形式进行存储的。
 1、类对象的类型:Class类型

 2、如何创建类对象:
 1)Class 类对象名 = [类名 class]; 简单方法

 2)类名 *对象名 = [类名 new];
 Class 类对象名 = [对象名 class];  复杂方法

 3)只要用1个类创建的多个类对象,地址都一样.

 3、如何使用类对象
 1)用类对象创建对象.
 2)用类对象调用类方法

 4、一般在什么时候需要使用类对象
 1)检查两个对象所处的类之间是否具有关系
 2)检查这个类中是否有这个方法
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Class p = [Person class];
        Person *u = [[Person alloc] init];
        Class n = [u class];
        // MARK: 证明--相同类创建的多个类对象，地址相同
        NSLog(@"p = %p, n = %p", p, n);
    }
    return 0;
}
