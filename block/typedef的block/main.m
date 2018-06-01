#import <Foundation/Foundation.h>
/*
 1、typedef 语法
    typedef 是定义类型，没有 typedef 是定义变量
 2、block 中的 typedef
    A、无参数无返回值的 typedef 的 block
        typedef void (^myBlock)(void);
    B、有参数有返回值的 typedef 的 block
        typedef int (^myBlock1)(int);
 3、block 访问外部变量
    注意：block 允许访问外部变量，但是，并不是直接访问外边的变量。它相当于把之前的变量在堆中创建了一个副本。他保存的是副本。注意：在 block 中，他保存的数据无法再随变量的改变而改变。
        如果想改变，则需要在创建变量的地方加上__block。则在 block 内部可以改变。出了大括号的下边无法再继续改变了。
 4、block 的应用
    A、将 block 作为函数参数传递。（注意：这里面的参数不能是 typedef 类型的）
    B、将 block 作为函数的返回值。（注意：这里面的返回值必须是 typedef 类型的）
    C、将 block 作为方法的参数时，需要将 block 放到最后。
 */
typedef void(^myBlock)(void);
typedef void(^intBlock)(void);
void func(void(^block)(void)){
    block();
}
myBlock func1() {
    return ^{
        NSLog(@"哈哈哈哈");
    };
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int num = 0;
        NSLog(@"%p", &num);
        intBlock block1 = ^{
            NSLog(@"num = %d", num);
            NSLog(@"&num = %p", &num);
        };
    }
    return 0;
}
