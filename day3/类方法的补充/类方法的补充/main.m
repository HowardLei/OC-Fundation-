/*
 在类方法中，可以调用对象方法
 1.对象作为方法的参数传递进来
 2.在方法中通过创建对象，再调用
 */
#import <Foundation/Foundation.h>
#import "Girl.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Phone * iPhone = [Phone new];
        [Girl callWithPhone:iPhone];
    }
    return 0;
}
