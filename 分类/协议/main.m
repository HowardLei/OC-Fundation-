#import <Foundation/Foundation.h>
#import "Person.h"
#import "extraProtocol.h"
#import "MyProtocol.h"
#import "Student.h"
/*
 1、协议：专门声明一大堆方法（不能声明属性，也不能实现方法）
      只要某个类遵守协议，就相当于有了协议中所有的方法的声明。
 
 2、协议的声明
    @protocol 协议名 <NSObject>
    方法的声明
    @end
    新建 1 个协议的方式： CMD + N -- OC File -- Protocol
    在协议中，只有一个 .h 文件。
 3、类遵守协议
    协议就是写方法的声明，就是用来被类遵守的
    如果想让一个类拥有这个协议中的方法，就让你这个类遵守这个协议。
    类遵守协议就相当于拥有协议中的方法所有声明。
        @interface 类名: 父类名 <协议名>
        @end
    注意：如果遵守协议，不实现协议中的方法，编译器只会报警告，但是在创建对象调用这个方法的时候，就会报错。
 4、类是单继承，协议是多遵守。
 5、@required 与 @optional
    在协议中，这两个关键字就是用来修饰协议中的方法。
    @required 修饰的方法必须实现，否则会报警告
    @optional 修饰的方法不一定实现。
    写这个标识符的重要性在于程序员之间的沟通。告诉他那些方法是必须实现的。
    默认是 @required
 6、NSObject
    NSObject 既是所有 OC 类基类，同时也是所有 OC 协议的基协议。
    NSObject 协议中的方法都被 NSObject 类遵守，所以，NSObject 协议中的方法所有 OC 类都拥有。
    注意：类名可以和协议的名称一致。
 7、协议的继承
    1）语法
        @protocol 协议名 <父协议>
        @end
    2）效果
        子协议不止是有自己方法的声明，同时还有父类方法的声明。
        如果一个类遵守这个协议，则他就拥有了这个协议中的所有方法的声明。
 8、规范
    要求所有的协议都必须直接或间接的继承 NSObject 基协议。
 9、协议的类型限制
    1）声明一个指针，可以指向任意对象。但是要求指向的对象必须遵守指定的协议。否则最起码要一个警告。
        例如：创建一个 NSObject 类，使其指向遵守协议的对象。即在类后边添加协议即可。
        NSObject<extraProtocol> *obj = @"wangnima";
        这样写编译器就会检查这个对象有没有遵守这个协议，如果没有遵守的话就会报警告。
    2）声明一个指针，使其指向的对象必须遵守多个协议。如果不遵守，继续报警告。
        id<MyProtocol, AnotherProtocol> stu1 = [[Student alloc] init];
    3）声明一个指针，指向遵守了 MyProtocol 的学生对象。
        id<MyProtocol> stu = [[Student alloc] init];
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student *stu = [[Student alloc] init];
        [stu jump];
    }
    return 0;
}
