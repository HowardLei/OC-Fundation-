#import <Foundation/Foundation.h>

@interface Mankind :NSObject
{
    @public
    NSString * _name;
    int _age;
    float _weight;
}
-(void)eat;
-(void)run;
-(void)jump;
//上面三个都是对象方法，对象方法前面用减号，'()'里面是返回值类型，后边是方法名。
+(void)dance;//这是类方法，类方法前用加号
@end

@implementation Mankind
-(void)eat{
    NSLog(@"瞅你这吃相");
}
-(void)run{
    NSLog(@"run too slow");
}
-(void)jump{
    NSLog(@"%d跳得起来吗",_age);//如果想调用方法数的时候，记得在int里面定义成员属性。
}
+(void)dance{
    NSLog(@"跟我一起跳");
    //NSLog(@"%d个人跟我一起high",_age);  在类方法中访问成员属性是不行的。成员属性是对象所拥有的。
}
@end
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Mankind * zhangsan = [Mankind new];
        [zhangsan eat];//调用对象方法：[对象名 对象方法]
        zhangsan->_age = 18;
        [zhangsan jump];
        [Mankind dance];//调用类方法:[类名 类方法]
    }
    /*
        注意：用类方法调用的时候，用对象方法无法再调用
     */
    return 0;
}
