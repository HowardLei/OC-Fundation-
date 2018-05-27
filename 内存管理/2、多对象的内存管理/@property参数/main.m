#import <Foundation/Foundation.h>
#import "Gamer.h"
#import "Room.h"
/*
 @property 参数
 1、atomic/nonatomic 多线程管理参数
    nonatomic：高性能，安全性低，一般在移动端使用
    atomic：低性能,默认，安全性高。（默认参数）
    atomic是Objc使用的一种线程保护技术,基本上来讲,是防止在写未完成的时候被另外一个线程读取,造成数据错误。而这种机制是耗费系统资源的,所以在 iPhone 这种小型设备上,如果没有使用多线程间的通讯编程,那么nonatomic是一个非常好的选择。

 2、retain/assign/copy 内存管理参数
    retain：用于 OC 对象类型,能够帮我们生成 setter 方法的内存管理代码。
    assign：用于基本数据类型,不做内存管理代码。
    copy：用于 NSString 类型，能够帮我们生成 setter 方法的内存管理代码。

 3、readwrite/readonly 读写方法参数
    readonly：只给外界提供get方法，不提供set方法。
    readwirte：可读可写.（默认方法）

 4、setter/getter 修改方法名参数
    setter：改 setter 方法的方法名。注意：在改setter方法的方法名的时候，一定要加冒号！！！
    getter：改 getter 方法的方法名
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
// MARK: 用 copy 参数实现的代码效果
void copy(){
    Gamer *zhangsan = [[Gamer alloc] init];
    zhangsan.name = @"张三丰";
    NSLog(@"%@", zhangsan.name);
    zhangsan.name = @"coolMan";
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        demo1();
        copy();
    }
    return 0;
}
