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
// MARK: 内存管理原理、分类及原则
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
            如何判断对象是否被释放。看系统是否调用了 dealloc 方法
            在每个OC对象内部,都专门有8个字节的存储空间来存储引用计数器。
            用 retainCount 方法查找引用计数器内的数量
     2、内存管理原则：谁 retain ，谁 release
     */
}
// MARK: ARC 与 MRC
void ReferenceCounting(){
    /*
     ARC: Automatic reference counting 自动引用计数法
     MRC: Mannul reference counting 手动引用计数法
     在 MRC 模式下，一共有 3 种方法：
     1、retain 方法。该方法的作用是将内存数据的所有权附给另一指针变量，引用数加1，即retainCount+= 1;（直接写的话相当于给了一个虚拟空间？？？）
     2、release 方法。该方法是释放指针变量对内存数据的所有权，引用数减1，即retainCount -= 1;注意：release并不代表销毁\回收对象，仅仅是计数器-1。当这个对象的引用计数为 0 的时候，系统会调用对象的 dealloc 方法释放他的内存。
     3、autorelease，该方法是将该对象内存的管理放到autoreleasepool中。（只是先放到池子里，暂时不销毁对象）
     */
}
// MARK: 内存管理基础代码
void demo1(){
//    int a = 10;
//    int b = 20;
//    Human *h = [[Human alloc] init]; // 程序结束后，这行代码中指针变量将会被回收，但是对象的内存系统并不会被主动回收，需要我们自己进行回收。
}
// MARK: 内存管理分配代码
void demo2(){
    // 创建一个人对象，用 p 指针变量接收，其默认引用计数为 1
    Human *p = [[Human alloc] init];
    // 检查 p 的引用计数
    NSLog(@"现在引用计数为%lu", [p retainCount]);
    // 将内存数据的所有权附给另一指针变量 s，引用数 +1
    Human *s = [p retain];
    // 现在这个人对象应该是有 2 个指针拥有它的所有权
    NSLog(@"现在引用计数为%lu", [p retainCount]);
    // 现在让 s 指针释放他对内存数据的所有权，引用数 -1
    [p release];
    // 现在这个人对象应该是有 1 个人拥有它的所有权。即：p
    NSLog(@"现在引用计数为%lu", [p retainCount]);
    // 让 p 指针 释放他对内存的使用权，引用数 -1
    [p release];
    // 现在人对象的引用计数为 0 ，现在系统会调用对象的 dealloc 方法。释放内存。
    //p 指针、s 指针 指向的对象为僵尸对象。他们就是野指针。
    // 这个被释放的对象称为僵尸对象。（不能再使用的对象）
    // 当1个指针变为野指针以后. 就把这个指针的值设置为nil 防止野指针乱指。
    p = s = nil;
    // 当他是空指针的时候，调用方法都没事。
    NSLog(@"现在引用计数为%lu", [p retainCount]);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        demo2();
    }
    return 0;
}
