#import "Person.h"

@implementation Person
-(void)sport{
    NSLog(@"%@先运动一下---对象方法",self->_name);//self访问成员变量例子
    [self eat];
    [self brush];
    /*
     self:自己
     本质:是1个指针.
     位置:只能用于方法中.
     
     1.self在对象方法中,代表当前对象.
     2.self在类方法中,代表当前类.
     3.self访问成员变量
     self->成员变量名.
     注意：在用self时候，不能直自己调用自己，否则会出现死循环
     */
}
-(void)eat{
    NSLog(@"%@就是爱吃---对象方法",_name);
}
-(void)brush{
    NSLog(@"%@吃完以后刷个牙---对象方法",_name);
}
+(void)sport{
    NSLog(@"大家先运动一下---类方法");
    [self eat];//self在这就代表People类
    [self brush];
}
+(void)eat{
    NSLog(@"我就是爱吃---类方法");
}
+(void)brush{
    NSLog(@"吃完以后刷个牙---类方法");
}
@end
