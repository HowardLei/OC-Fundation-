
#import "Student.h"

@implementation Student
-(void)setAge:(int)age//设置一个筛选方法，将不符合的数据类型筛选掉
{
    if (age > 5 && age < 10) {
        _age = age;
        NSLog(@"%d",_age);
    } else {
        NSLog(@"不符合逻辑");
    }
}
-(int)Age//get方法，得到属性的值，即内部的成员变量
{
    return _age;
}
@end
