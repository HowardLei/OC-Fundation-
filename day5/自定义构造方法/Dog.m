
#import "Dog.h"

@implementation Dog
- (instancetype)init
{
    //谁在用self所在的方法，self就指向谁，self就是谁
    self = [super init];
    if (self) {
        _age = 1;
        //自己的初始化方法
        NSLog(@"DOG---%@",self);
    }
    return self;//通过self返回给子类
}
@end
