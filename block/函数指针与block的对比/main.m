#import <Foundation/Foundation.h>
// MARK: 创建一个无参数，无返回值的函数
void demo1() {
    NSLog(@"王尼玛");
}
// MARK: 创建一个带参数，无返回值的函数（两个数之间的加和）
void demo2(int a, int b) {
    NSLog(@"两个数的和为%d", a + b);
}
// MARK: 创建一个带参数，带返回值的函数（两个数之间的加和）
int demo3(int a, int b) {
    return a + b;
}
// MARK: demo1 函数指针与 block 的对比写法
void try1() {
    // 创建 demo1 的函数指针 test1
    void (*test1)(void) = &demo1;
    // 调用 test1 函数
    test1();
    // 创建 demo1 的block
    void(^myBlock1)(void) = ^() {
        demo1();
    };
    // 实现 block
    myBlock1();
}
// MARK: demo2 函数指针与 block 的对比写法
void try2() {
    // 创建 demo2 的函数指针
    void (*test2)(int, int) = &demo2;
    int a = 10, b = 20;
    // 调用 test2 函数
    test2(10, 20);
    // 创建 demo2 的 block
    void(^myBlock2)(int, int) = ^(int a, int b) {
        NSLog(@"两个数的和为:%d", a + b);
    };
    // 调用 block
    myBlock2(a, b);
}
// MARK: demo3 函数指针与 block 的对比写法
void try3() {
    // 创建 demo3 的函数指针
    int (*test3)(int, int) = &demo3;
    int a = 10, b = 20;
    // 调用函数
    int sum1 = test3(a, b);
    NSLog(@"调用函数指针求的和为:%d", sum1);
    // 创建 demo3 的 block
    int(^myBlock3)(int, int) = ^(int a, int b) {
        return a + b;
    };
    int sum2 = myBlock3(a, b);
    NSLog(@"用 block 求的和为:%d", sum2);
}
/*
 总结：block 与函数指针的区别
    1、函数指针只能指向预先定义好的函数代码块（可以是其他文件里面定义，通过函数参数动态传入的），函数地址是在编译链接时就已经确定好的。
    2、Block 本质是 Objective-C 对象（他有 isa 指针），是 NSObject 的子类，可以接收消息。
    3、函数里面只能访问全局变量，而Block代码块不光能访问全局变量，还拥有当前栈内存和堆内存变量的可读性（当然通过 __block 访问指示符修饰的局部变量还可以在 block 代码块里面进行修改）。
    4、从内存的角度看，函数指针只不过是指向代码区的一段可执行代码，而 block 实际上是程序运行过程中在栈内存动态创建的对象，可以向其发送 copy 消息将 block 对象拷贝到堆内存，以延长其生命周期。
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        try1();
        try2();
        try3();
    }
    return 0;
}
