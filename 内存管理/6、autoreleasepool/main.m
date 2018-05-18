#import <Foundation/Foundation.h>
#import "Person.h"
/*
 autoreleasepool：自动释放池
 1、定义：(1)在iOS程序运行过程中,会创建无数个池子,这些池子都是以栈结构(先进后出)存在的。
        (2)当一个对象调用autorelease时,会将这个对象放到位于栈顶的释放池中。
 2、 autorelease 方法
    是一种支持引用计数的内存管理方式
    它可以暂时的保存某个对象(object)，然后在内存池自己的排干(drain)的时候对其中的每个对象发送release消息。
    注意,这里只是发送一次 release 消息，如果当时的引用计数(reference-counted)依然不为0，则该对象依然不会被释放。可以用该方法来保存某个对象，也要注意保存之后要释放该对象。
 3、为啥会出现 autorelease 方法？



 */
// MARK: 创建一个人对象
Person* demo1(){
    Person * person = [[[Person alloc] init] autorelease];
    return person;
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *s = demo1();
        NSLog(@"%lu", [s retainCount]);
        Person *p = [[Person new] autorelease];
        p.name = @"王尼玛";
// 如果这个时候还写 [p retain]; 则会导致最后出大括号的时候 p 没法销毁，造成内存泄露。
        NSLog(@"%@", p.name);
    }
    return 0;
}
