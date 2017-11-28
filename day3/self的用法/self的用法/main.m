//self解释看Person.m文件
#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person * zhangsan = [Person new];
        zhangsan->_name = @"张三丰";
        [zhangsan sport];
        
        Person * lisi = [Person new];
        lisi->_name = @"李四";
        [lisi sport];//不管之前的对象是啥，在调用的时候self只代表李四这个对象
        NSLog(@"--------");
        [Person sport];
     }
    return 0;
}
