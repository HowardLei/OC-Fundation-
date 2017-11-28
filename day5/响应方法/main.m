#import "Dog.h"
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Dog * d = [Dog new];
        
        //查看他的响应方法，结构:[对象名 performSelector:<#(SEL)#>](SEL)中间加方法名
        [d performSelector:@selector(run)];
        //含参数方法查看其相应方法[对象名 performSelector:<#(SEL)#> withObject:<#(id)#>],其中有几个参数就加几个withObject:(id)
        [d performSelector:@selector(setName:) withObject:@"李四"];
    }
    return 0;
}
