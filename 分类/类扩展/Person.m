#import "Person.h"
@interface Person ()
{
    // 这里面的成员变量均不能直接访问。
    NSString *_name;
    int _age;
}
// 这里面的方法对象没法调用。
- (void)show;
- (void)setName:(NSString *)name;
- (NSString *)name;
@end

@implementation Person

- (void)show {
    NSLog(@"展示一切");
}
- (void)look {
    [self show];
}
- (void)setName:(NSString *)name{
    _name = name;
}
- (NSString *)name {
    return _name;
}
@end
