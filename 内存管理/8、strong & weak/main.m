#import <Foundation/Foundation.h>
#import "Person.h"
/*
 strong & weak
 1、__strong 与 __weak
    A、__strong 指针
    1）所有的指针如果不加修饰符的话默认为 __strong，因为它们能够保持对象的生命。
    2）在 ARC 中，如果对象 = nil，则会释放该对象。这是因为没有指针指向该对象，即该对象无人使用，则会销毁。（注意：是整个对象都销毁，不保留成员变量所指对象的指针。）
    B、__weak 指针
    1）weak 型的指针变量仍然可以指向一个对象，但不属于对象的拥有者。
    2）weak 指针主要用于“父-子”关系，父类拥有一个子类的 strong 指针，因此父类是子类的所有者；但为了阻止所有权循环,子类需要使用weak指针指向父类。
    3）weak 指针不能直接初始化对象，一旦初始化则会直接释放。并且指针自动指向 nil 。
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] initWithName:@"123"];
        Dog *d = [[Dog alloc] init];
        __weak Person *p1 = [[Person alloc] init];
        p.dog = d;
    }
}
