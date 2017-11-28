#import <Foundation/Foundation.h>

@interface mankind :NSObject
{
    @public
    NSString *_name;
    int _age;
    int _weight;
}
- (void)eat:(NSString *)Foodname;//先声明一个有单参数的方法，方法名 eat： （注意千万不要忘了加这个：） 参数的类型 NSString * ;参数名 Foodname
@end

@implementation mankind


- (void)eat:(NSString *)Foodname{
    NSLog(@"%@就是爱吃你给的%@",_name,Foodname); //引用参数的时候，记得写上的是参数名
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        mankind * zhangsan = [mankind new];
        zhangsan->_name = @"张三";
        [zhangsan eat:@"辣条"];
        }
    return 0;
}
