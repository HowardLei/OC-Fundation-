#import <Foundation/Foundation.h>
#import "Person.h"
/*
 1、集合
    NSArray 集合、NSDictionary 字典集合、 NSSet 广义集合
 2、在 MRC 中，将一个对象存储在集合中的时候，这个对象的引用计数器会 +1
    当集合销毁的时候，就会向存储在这个集合中的所有对象发送一条 release 消息
 3、用 @[] 以及 @{} 创建的集合是已经被 autorelease 过的了
    直接在里面创建的元素同样也是被 autorelease 过的
 4、在 ARC 模式下，集合中的元素是强类型的指针。
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool{
        Person *p = [[Person alloc] init];
        NSUInteger a = p.retainCount;
        NSLog(@"%lu", a);
    }
    return 0;
}
