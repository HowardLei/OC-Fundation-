/*
 @property的组合用法:
 只要同种类型,就可以写在一起.用逗号进行分隔
 比如:
 @property int age,height,weight;
 @property NSString *name;
 
 @synthesize的组合用法:
 不区分数据类型,只要被@property修饰,就可以写在一起,用逗号进行分隔
 比如:@synthesize age = _age,height = _height,weight = _weight,name = _name;
 
 @property的加强用法:
 1.生成set和get方法的声明
 2.生成set和get方法的实现
 3.生成带下划线的成员变量.
 
 注意事项:
 1. 当用户手动重写了set方法时,@property会生成get方法和带下划线的成员变量
 2. 当用户手动重写了set和get方法时.@property不会生成待下划线的成员变量.
 3. 当用户手动重写了get方法时,@property会生成set方法和带下划线的成员变量.
 */
#import "Student.h"
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student * z = [Student new];
        z.age = 10;
        z.name = @"张三";
        NSLog(@"%d,%@",z.age,z.name);
    }
    return 0;
}
