#import <Foundation/Foundation.h>
// 关于字符串，先去学习基础的代码，等到后边在应用的时候，需要啥再去学习新的。然后总结在一个文件中
// 注意：NSString 类是不可变字符串
// MARK: 字符串的添加
void add() {
    // 1、从文本文件中获取字符串
    //NSString *str = NSString stringWithContentsOfFile:路径地址（注意：里面是NSString类型） encoding:编码格式(代码) error:<#(NSError * _Nullable __autoreleasing * _Nullable)#>
    NSString *str = [NSString stringWithContentsOfFile:@"/Users/jyz/Desktop/a.m" encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@", str);
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
    }
    return 0;
}
