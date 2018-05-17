#import <Foundation/Foundation.h>
#import "Person.h"
#import "Cat.h"
// 需求：一个人有一只猫。一个猫有个主人。
/*

 如果直接用 import ，则会导致循环引用 import。编译器报错。
 而且，如果一个文件中 import 文件过多的话，如果这些引入的 import 的文件一旦修改，则关联的文件也得重新编译，降低效率。
 而用 @class 则不会。只是告诉编译器有一个猫类，可以声明一个对象，并不会包含这个类的所有内容。
 注意：@class 引入的类可以是个本身不存在的类。
 一旦需要调用 @class 类的方法时，可以在 .m 文件 import 其头文件。
 在开发中，一般先在头文件使用 @class 。真的需要他里面的方法和成员变量的时候，再在实现文件中 import 。

 最本质的问题：import 和 @class 的区别
 1、作用上：import会包含引用类的所有信息(内容)，包括引用类的变量和方法 @class仅仅是告诉编译器有这么一个类，具体这个类里有什么信息，完全不知道。
 2、效率上：如果有上百个头文件都#import了同一个文件，或者这些文件依次被#import，那么一旦最开始的头文件稍有改动,后面引用到这个文件的所有类都需要重新编译一遍,相对来讲编译效率非常低，使用@class方式就不会出现这种问题了。
 */
// 注意：在进行循环引用的时候，不要两个方法的 @property 参数都为 retain 。会导致最后无法释放。
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        Cat *c = [[Cat alloc] init];
        p.cat = c;
        c.person = p;
        [c release];
        [p release];
    }
    return 0;
}
