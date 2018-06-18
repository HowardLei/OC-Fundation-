#import <Foundation/Foundation.h>
/*
 在 Foundation 框架下有几个常用的结构体
 1、NSRange（表示范围的）
 2、NSPoint（表示一个点，等价于 CGPoint ）
 3、NSSize（表示大小，即UI组件的宽度高度，等价于 CGSize ）
 4、NSRect（表示一个矩形，等价于 CGRect ）
 */
// MARK: NSRange 结构体
void nsrange() {
//     先创建一个 NSRange 的结构体
    NSRange a = {3, 4};
    // 为 a 赋值有一下五种方法
    // 1、点操作符赋值
    a.location = 300; a.length = 20;
    // 2、初始化的时候就赋值
    // 3、通过 NSMakeRange 方法赋值
    a = NSMakeRange(230, 213);
    // 4、初始化赋值方法2
    NSRange b = {.location = 7, .length = 29};
    // 在输出 NSRange 的数据的时候，可以先将其转换为 NSString 类型，再进行输出。调用 NSStringFromRange 函数
    NSLog(@"%@", NSStringFromRange(a));
    NSLog(@"%@", NSStringFromRange(b));
}
// MARK: NSPoint 结构体
void nspoint() {
    // 创建一个 NSPoint 结构体
    NSPoint point = {20, 40};
    // 为 point 赋值 ，调用 CGPointMake 函数或者是 NSMakePoint 函数
    point = CGPointMake(20.12, 3.2);
    point = NSMakePoint(213, 42);
    // 输出 NSPoint 数据的时候，可以像输出 NSRange 那样，先将其转换为 NSString 型，再输出，调用 NSStringFromPoint 函数
    NSLog(@"%@", NSStringFromPoint(point));
}
// MARK: NSSize 结构体
void nssize() {
    // 创建一个 NSSize 结构体
    NSSize size;
    // 为这个结构体设置高度、宽度
    size.height = 20;
    size.width = 30;
    // 用 Make 函数设置值 第一个参数为: width 第二个参数为: height
    size = NSMakeSize(20, 22);
    // 另外一种为 NSSize 赋值的办法
    NSSize size1 = {.width = 20, .height = 23};
    // 输出 NSSize 中的数据，调用函数 NSStringFromSize 返回值为 NSString 类型
    NSLog(@"%@", NSStringFromSize(size1));
}
// MARK: NSRect 结构体
void nsrect() {
    // 创建 NSRect 结构体 注意：NSRect 的参数为 4 个，前面 2 个的参数为 CGPoint ，后边 2 个参数为 CGSize
    NSRect rect = {20, 40, 43, 23};
    // 用 Make 函数为 rect 赋值
    rect = NSMakeRect(50, 30, 32, 30);
    // 输出 NSRect 中的数据，调用函数 NSStringFromRect 返回值为 NSString 类型
    NSLog(@"%@", NSStringFromRect(rect));
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        nsrange();
        nspoint();
        nssize();
        nsrect();
    }
    return 0;
}
