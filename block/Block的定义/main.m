#import <Foundation/Foundation.h>
/*
 block（块）：一种特殊的数据类型。应用于：
    1）动画
    2）多线程
    3）集合遍历
    4）网络请求回调
 定义格式：返回值(^块名)(参数) = ^(参数) {
            保存的代码
        }; 写法上与函数指针相似。
        注意：第一个括号重的参数只写参数类型，第二个括号里面的参数必须带参数名
             block 的调用属于延迟调用。
 */
void demo1() {
    NSLog(@"不知道");
}
// 用 typedef 声明一个 block 的名。（用于化简前面的一大推东西，类似于化简 struct）。
typedef int (^calc)(int a, int b);
typedef void (^myBlock1)(void);
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 函数指针写法
        void (*p)(void) = &demo1;
        // 回调函数 p
        p();
        // block 写法
        void(^myBlock)(void) = ^() {
            NSLog(@"-----");
        };
        // 回调 block
        myBlock();
        int a = 12, b = 23;
        calc func = ^(int a, int b){
            return a + b;
        };
        myBlock1 func1 = ^() {
            NSLog(@"这是一个块");
        };
        int temp = func(a, b);
        NSLog(@"%d", temp);
    }
    return 0;
}
