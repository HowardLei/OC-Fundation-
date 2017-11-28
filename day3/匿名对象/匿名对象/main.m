
#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //匿名对象
        [Student new]->_age = 20;
        NSLog(@"%d", [Student new]->_age);
        /*
         1.在匿名对象的时候不能打印上边的属性，因为每次创建一次匿名对象的时候就会重新在堆区开辟一片新的内存空间，与之前创建的无关。
         2.匿名对象的内存分配在堆上，而不再栈上;
         3.匿名对象只能使用1次
         4.每次开发的时候尽量避免创建匿名对象，偶尔调用同一方法的时候可以使用。
         缺点：造成内存泄漏
         结论：不建议使用
         */
    }
    return 0;
}
