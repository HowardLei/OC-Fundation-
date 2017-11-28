/*
 一、id:万能指针,能够指向任何OC对象.
 当指针类型是(id)类型的时候,编译器不做编译检查.
 用法:
 1.可以作为参数
 2.作为成员变量
 
 二、NSObject万能指针
 
 里氏替换原则:
 父类的指针指向子类的对象,对程序没有任何的影响,这就是里氏替换原则.
 
 NSObject类是所有OC类的父类,根据里氏替换原则,NSObject指针可一直想任意的OC对象.
 
 当NSObject指针指向子类对象的时候,如果要调用子类对象独有的方法,就必须做类型转换.
 
 NSObject指针是一个万能指针.
 当指针类型是(NSObject *)类型的时候,编译器要做编译检查.
 
 NSObject指针的局限性,只能使用中括弧调用方法,不能使用点语法.
 */
#import "IOS.h"
#import "PHP.h"
#import "Student.h"
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student * s = [Student new];
        s.obj = @"10";
        s.name = s.obj;
        NSLog(@"%@",s.name);
        id ios = [IOS new];
        id php = [PHP new];
        [s studyWithLanguage:ios];
        [s studyWithLanguage:php];
    }
    return 0;
}
