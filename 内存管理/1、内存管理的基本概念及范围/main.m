#import <Foundation/Foundation.h>
#import "Human.h"
#import "Dog.h"
// MARK: 内存管理基础
void ramFoundation(){
    /*
     1、为什么进行内存管理？
     及时将不用的数据回收，合理分配和管理内存，以提高程序的运行效率。
     2、什么情况下会增加内存占用？
     1）创建 OC 对象
     2）创建一个变量
     3）定义函数与方法
     3、我们能管理哪部分内存？
     在 OC 中，能管理任何继承自 NSObject 的对象的内存。
     因为他是创建在堆区。无法自动释放。
     */
}
// MARK: 内存管理原理及分类
void ramAdmin(){
    /*
     1、基础概念
        （1）对象的使用权
            任何对象都有一个或多个拥有者。只要一个对象至少还拥有一个所有者,它就会继续存在。
            例如：一间教室，里面有学生，那么学生就是教室的所有者。如果教室里有学生，那么教室里面的灯就不能关闭。一旦教室没人了，教室的灯就可以关闭了。
            Cocoa 所有权策略
            任何自己创建的对象都归自己所有，可以使用名字以"alloc"或"new"开头或名字中包含“copy”的方法创建对象，可以使用retain方法来获得一个对象的所有权。
        （2）对象的引用计数器
            每个OC对象都有自己的引用计数器，是一个整数表示对象被引用的次数（有多少个所有者
            ），即现在有多少东西在使用这个对象。对象刚被创建时，默认计数器值为1，当计数器的值
            为0时，则对象销毁。
            在每个OC对象内部,都专门有8个字节的存储空间来存储引用计数器。
            用 retainCount 方法查找引用计数器内的数量
     */
}
// MARK: ARC 与 MRC
void ReferenceCounting(){
    /*
     ARC: Automatic reference counting 自动引用计数法
     MRC: Mannul reference counting 手动引用计数法
     在 MRC 模式下，一共有 3 种方法：
     1、retain 方法。该方法的作用是将内存数据的所有权附给另一指针变量，引用数加1，即retainCount+= 1;（直接写的话相当于给了一个虚拟空间？？？）
     */
}
// MARK: 内存管理基础代码
void demo1(){
    int a = 10;
    int b = 20;
    Human *h = [[Human alloc] init]; // 程序结束后，这行代码中指针变量将会被回收，但是对象的内存系统并不会被主动回收，需要我们自己进行回收。
}
// MARK: 内存管理分配代码
void demo2(){
    // 创建一个人的对象，默认引用计数器就为 1 。
    Human *h = [[Human alloc] init];
    NSLog(@"%lu", [h retainCount]);
    // 向 h 发送 retain 消息，引用计数器就 +1 。
    Human *p = [h retain];
    // 所以现在 [h retainCount]为 2 。
    NSLog(@"%lu", [h retainCount]);
    // 向 h 发送 release 消息，引用计数器就 -1 。
    [p release];
    // 所以现在 [h retainCount]为 1 。
    NSLog(@"%lu", [h retainCount]);
    // 再向 h 发送 release 消息，引用计数器再 -1 。注意这个时候只是计数器为 0 。并不代表销毁/回收对象。需要重写 dealloc 方法才能进行
    [h release];
    NSLog(@"%lu", [h retainCount]);
}
void try(){
    Dog *d = [Dog new];
    Dog *s = d;
    NSLog(@"%lu",[d retainCount]);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        demo2();
//        try();
    }
    return 0;
}
