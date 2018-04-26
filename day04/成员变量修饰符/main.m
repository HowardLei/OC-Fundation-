#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
/*
 成员变量修饰符 一共4个
 1、@public:只要导入头文件，任何位置都能够直接访问
 2、@protected:可以在本类或子类进行使用（在类的接口部分定义的成员变量默认权限）
 3、@private:只能在本类当中进行访问，子类无法进行访问赋值
 4、@package:在同一个框架内可以直接访问（一般用于联合开发）

 注意：修饰符控制的是类直接访问（指针访问）成员变量的权限。与用方法控制变量的值区分！！！
 用法：1、类的绝大多数的成员变量都应该设置成 @private 。
      2、如果某个类主要作为其他类的父类，其里面的成员变量希望被子类访问，考虑用 @protected
      3、如果希望暴露给其他类自由调用的方法应该先在 @interface 处定义，在 @implementation 处实现

 私有方法
 在OC中，没有特别针对私有方法设置关键字。声明里面没有该方法，却有该方法的实现，即为私有方法。调用私有方法需要一下几点
 1、在 .h 文件中不需要声明方法，只需要在 .m 文件中对其进行实现即可。
 2、所有的私有方法均不能被外界访问，不可被子类继承。
 3、父类定义的私有方法在子类中可以定义同类方法。
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        p.name = @"王尼玛";
//        [p run]; 这个方法是私有方法，所以无法访问
        [p usePrivateMethod];
        NSLog(@"%@", p.name);
        Student *s = [[Student alloc] init];
        s.name = @"jjj";
        NSLog(@"%@", s.name);
    }
    return 0;
}
