/*
 1.要求:满7岁才能上小学.
 当我们给学生年龄赋值时,只要符合年龄的数据类型,就可以随意赋值.编译器和运行都不会有问题.
 
 但是:如果给学生年龄赋值0岁,合理吗?
 
 解决方案:
 1.不用@public修饰，保证值不会被随意修改
 2.我们对象有访问和设置成员变量的两种操作
 1>设置值
 p->age = 10;
 2>访问值
 NSLog(@"%d",p->age);
 
 现在要提供两个方法来进行设置值和访问值
 1>设置成员变量
 格式:
 - (void)set成员变量名(去掉下划线,首字母大写):(成员变量数据类型)成员变量名(去掉下划线);
 - (void)setAge:(int)age;
 
 2>访问成员变量
 格式:
 - (成员变量数据类型)成员变量名(去掉下划线);
 - (int)age;
 */
#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student * s = [Student new];
        [s setAge:6];
        //用于打get方法的数据
        int age = [s Age];
        NSLog(@"上学年龄为%d岁",age);
    }
    return 0;
}
