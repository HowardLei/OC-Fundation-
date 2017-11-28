/*
 1.@property用法
 格式：@property 成员变量 成员变量名称（去掉下划线）;
 作用：能够生成set和get方法的声明.
 
 2.@synthesize用法:[了解]
 格式:@synthesize 成员变量名(去掉下划线,必须被@property修饰);
 注意:会生成1个私有的成员变量,以及set和get方法的实现.
 私有方法代码：
 1.@synthesize生成的第一部分代码
 {
 NSString *name;
 } 
 2.第二部分
 - (void)setName:(NSString *)name{
 self->name = name;
 }
 - (NSString *)name{
 return self->name;
 }
 
 问题:如果要@synthesize赋值给自己的带下划线的成员变量,怎么办?
 @synthesize 成员变量名(去掉下划线,必须被@property修饰) = 带下划线的成员变量名.
 @synthesize age = _age; 就是让外界把值赋值给_age;
 */
#import "Student.h"
#import <Foundation/Foundation.h>
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student * zhangsan = [Student new];
        zhangsan.name = @"张三丰";
        NSLog(@"%@",zhangsan.name);
    }
    return 0;
}
