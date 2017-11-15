#import <Foundation/Foundation.h>
/*
 
 思考与实现
 设计一个“学生”类
 1）属性
 姓名
 生日
 
 用结构体作为类的实例变量(生日)
 
 定义结构用来描述 生日
 
 类名: Student
 属性: _name, 结构体变量表示生日
 
 */
//创建生日结构体
struct student{
    int y;
    int m;
    int d;
};   //结构体创建的时候记得‘}’外还有';'
//MARK:声明学生
@interface Student : NSObject
{
    @public
    NSString * _name;
    struct student _birthday;//声明结构体属性
}

@end

@implementation Student
@end
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student * zhangsan = [Student new];
        zhangsan->_name = @"张三丰";
        Student * lisi = [Student new];
        lisi->_name = @"李四";
        //给结构体赋值方法1
        zhangsan->_birthday.y = 2000;
        zhangsan->_birthday.m = 02;
        zhangsan->_birthday.d = 29;
        NSLog(@"name = %@ 出生于%d年%d月%d日",zhangsan->_name,zhangsan->_birthday.y,zhangsan->_birthday.m,zhangsan->_birthday.d);//由于这是已经创建了张三这个对象，所以是zhangsan->属性
        
        //给结构体赋值方法2
        struct student mydate = {1999,01,01};//对这个对象定义一个结构体
        lisi->_birthday = mydate;//这个地方直接引用就行
        NSLog(@"name = %@ 出生于%d年%d月%d日",lisi->_name,lisi->_birthday.y,lisi->_birthday.m,lisi->_birthday.d);
    }
    return 0;
}
