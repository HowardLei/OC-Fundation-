//
//  Person.m
//  成员变量修饰符
//
//  Created by jyz on 2018/4/26.
//

#import "Person.h"

@implementation Person
- (void)setName:(NSString *)name{
    _name = name;
}
- (NSString *)name{
    return _name;
}
- (void)setAge:(int)age{
    _age = age;
}
- (int)age{
    return _age;
}
// MARK: 创建一个私有方法
- (void)privateRun{
    NSLog(@"只有我决定跑步，别人都不能");
}
// MARK: 调用私有方法
- (void)usePrivateMethod{
    [self privateRun];
}
@end
