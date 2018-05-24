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
    OC的内存管理机制中比较重要的一条规律是：谁申请，谁释放
    考虑这种情况，一个方法需要返回一个新建的对象，该对象何时释放？
    方法内部是不会写release来释放对象的，因为这样做会将对象立即释放而返回一个空对象；
    调用者也不会主动释放该对象的,因为调用者遵循“谁申请，谁释放”的原则。那么这个时候，就发生了内存泄露。
    为了解决这个问题，需要在初始化对象完后再写一个 autorelease 的方法。
 4、autorelease 的原理
    autorelease 实际上只是把对 release 的调用延迟了,对于每一个 Autorelease ，系统只是把该 Object 放入了当前的 Autorelease pool中，当该 pool 被释放时，该 pool 中的所有 Object 会被调用release。
 5、使用 autorelease 的好处
    (1)不需要再关心对象释放的时间
    (2)不需要再关心什么时候调用release
 6、如何创建 autoreleasepool ？
 iOS 5之前 NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
      之后 @autoreleasepool{对象写在这里面} 出了大括号，池子销毁，对加入到池子里面的对象都做一次 release
 7、autoreleasepool 注意事项
    （1）自己创建对象后,手动调用release操作,这样释放池并不会对对象进行release操作.
    （2）对象可以在释放池外部创建,只要在释放池内部调用autorelease方法,就是把对象加入到了释放池中.
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
        Person *p = [[[Person alloc] init] autorelease];
        p.name = @"王尼玛";
// 如果这个时候还写 [p retain]; 则会导致最后出大括号的时候 p 没法销毁，造成内存泄露。
        NSLog(@"%@", p.name);
    }
    return 0;
}
