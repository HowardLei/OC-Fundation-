/*
 点语法本质：编译器看到对象使用点语法，会自动把点语法转换为调用set或get方法的形式。
 点语法是编译器的特性，不能用于普通方法，只能用于set和get方法
 点语法注意事项:
1.用在set方法中:
- (void)setAge:(int)age
{
    self.age = age;// 死循环
}
2.在get方法中:
- (int)age
{
    return self.age;//同样，死循环
}
注意点:什么时候会生成set方法什么时候会生成get方法?
如果有赋值运算符,生成set方法,否则,生成get方法.
*/

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student * zhangsan = [Student new];
        //传统方法
        [zhangsan setName:@"张三丰"];
        NSLog(@"%@",[zhangsan Name]);
        //点语法
        zhangsan.Age = 10;//他的等价就是[zhangsan setAge:10];
        int aAge =zhangsan.Age;
        NSLog(@"%d",aAge);//上边这2行等价NSLog(@"%@",[zhangsan Name]);
        return 0;
    }
}
