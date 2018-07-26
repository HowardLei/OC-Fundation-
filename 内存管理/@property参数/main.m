#import <Foundation/Foundation.h>
#import "Gamer.h"
#import "Room.h"
#import "Person.h"
/*
 @property 参数
 1、atomic/nonatomic 多线程管理参数
    nonatomic：高性能，安全性低，一般在移动端使用
    atomic：低性能,默认，安全性高。（默认参数）
    atomic是Objc使用的一种线程保护技术,基本上来讲,是防止在写未完成的时候被另外一个线程读取,造成数据错误。而这种机制是耗费系统资源的,所以在 iPhone 这种小型设备上,如果没有使用多线程间的通讯编程,那么nonatomic是一个非常好的选择。

 2、retain/assign/copy 内存管理参数
    retain：用于 OC 对象类型,能够帮我们生成 setter 方法的内存管理代码。
    assign：用于基本数据类型,不做内存管理代码。
    copy：用于 NSString 类型，能够帮我们生成 setter 方法的内存管理代码。（后边特别总结）

 3、readwrite/readonly 读写方法参数
    readonly：只给外界提供get方法，不提供set方法。
    readwirte：可读可写.（默认方法）

 4、setter/getter 修改方法名参数
    setter：改 setter 方法的方法名。注意：在改setter方法的方法名的时候，一定要加冒号！！！
    getter：改 getter 方法的方法名
 
 5、copy 方法
    copy 本身是个方法，本身分为浅拷贝和深拷贝
    浅拷贝：即在拷贝的时候不产生对象，直接返回原对象的地址。
    深拷贝：即在拷贝的时候产生新对象。
 
 6、copy 参数
    在 @property 中，为了防止属性随便改变，参数需写 copy。
 7、自定义类实现对象的 copy。
    注意：copy 方法是在 NSObject 类下的方法，但是调用这个方法的时候，同时调用了 copyWithZone: 方法。这个方法需要遵守 NSCopying 协议，所以说对象在创建的时候需要遵守 NSCopying 协议
 */
// MARK: 用 @property 中的 retain 参数来进行创建 setter 和 getter 方法，结果与之前创建的手写的效果代码一样。
void retain(){
    Gamer *p = [[Gamer alloc] init];
    Room *room1 = [[Room alloc] init];
    Room *room2 = [[Room alloc] init];
    p.room = room1;room1.no = 1;
    NSLog(@"现在%@在%d号房间有%lu个人",p, p.room.no, [p.room retainCount] - 1);
    p.room = room2;room2.no = 2;
    NSLog(@"现在%@在%d号房间有%lu个人", p, p.room.no, [p.room retainCount] - 1);
    [p release];
    [room1 release];
    [room2 release];
}
// MARK: copy 方法
void copy(){
    //1、测试 NSString 类的 copy 方法
    NSString *str1 = @"王尼玛";
    NSString *str2 = str1.copy;
    NSLog(@"%p,%p", str1, str2);
    // 结论：NSString 类的 copy 方法为浅拷贝
    [str1 copyWithZone:NSDefaultMallocZone()];
    // 2、测试 NSMutableString 的 copy 方法
    NSMutableString *varStr1 = [NSMutableString stringWithString:str1];
    NSMutableString *varStr2 = varStr1.copy;
    NSLog(@"%p,%p", varStr1,varStr2);
    // 结论：NSMutableString 类的 copy 为深拷贝，他拷贝的对象是 NSString 类的（就算拿 NSMutableString 类的指针接收，对象仍然是 NSString 类的对象）。
    
    // 3、mutableCopy 方法。全部都是深拷贝，copy 产生的对象都是 NSMutableString 型。
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        demo1();
//        copy();
        Person *p = [[Person alloc] init];
        Person *p1 = p.copy;
        NSLog(@"%p,%p", p, p1);
    }
    return 0;
}
