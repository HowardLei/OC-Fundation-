#import <Foundation/Foundation.h>
// 关于字符串，先去学习基础的代码，等到后边在应用的时候，需要啥再去学习新的。然后总结在一个文件中
// 注意：NSString 类是不可变字符串
// MARK: 字符串的添加
void add() {
    // 1、从文本文件中获取字符串
    //NSString *str = NSString stringWithContentsOfFile:路径地址（注意：里面是NSString类型） encoding:编码格式(代码) error:NSError类型的二级指针
    // 先创建一个 err 对象
    NSError *err = nil;
    // 这个地方为啥 error 是在用二级指针，因为这个方法需要判断这个文件到底存在不存在。如果存在，则 err 判断为0，则在下边判断的时候加个非即为真。否则输出错误的信息。
    NSString *str = [NSString stringWithContentsOfFile:@"/Users/jyz/Desktop/a.m" encoding:NSUTF8StringEncoding error:&err];
    if (!err) {
        NSLog(@"%@", str);
    } else {
        NSLog(@"%@", err);
    }
    // 2、通过 URL 获取字符串（URL:统一资源定位符,用于定位网上的资源。构成：协议://主机:端口/路径?参数）
}
// MARK: 字符串的删除
void delete() {

}
// MARK: 字符串的修改
void alter() {

}
// MARK: 字符串的查找
void search() {

}
// MARK: 字符串的其他方法
void others() {

}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 1、NSString 类的构造方法
        add();
        delete();
        search();
    }
    return 0;
}
