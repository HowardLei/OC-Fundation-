#import <Foundation/Foundation.h>
// 关于字符串，先去学习基础的代码，等到后边在应用的时候，需要啥再去学习新的。然后总结在一个文件中
// 注意：NSString 类是不可变字符串
NSString *getNSString() {
    char str[256];
    NSLog(@"请输入一个字符串");
    fgets(str, 255 * sizeof(char), stdin);
    return [NSString stringWithUTF8String:str];
}
// MARK: 字符串的添加
void add() {
    // 1、从文本文件中获取字符串
    //NSString *str = NSString stringWithContentsOfFile:路径地址（注意：里面是NSString类型） encoding:编码格式(代码) error:NSError类型的二级指针
    // 先创建一个 err 对象
    NSError *err;
    // 这个地方为啥 error 是在用二级指针，因为这个方法需要判断这个文件到底存在不存在。如果存在，则 err 判断为0，则在下边判断的时候加个非即为真。否则输出错误的信息。
    NSString *str = [NSString stringWithContentsOfFile:@"/Users/jyz/Desktop/a.m" encoding:NSUTF8StringEncoding error:&err];
    if (!err) {
        NSLog(@"%@", str);
    } else {
        NSLog(@"%@", err);
    }
    // 2、通过 URL 获取字符串（URL:统一资源定位符,用于定位网上的资源。构成：协议://主机:端口/路径?参数）
    NSURL *p = [[NSURL alloc] initWithString:@"https://www.baidu.com/"];
    NSError *err1;
    NSString *str1 = [[NSString alloc] initWithContentsOfURL:p encoding:NSUTF8StringEncoding error:&err1];
    if (!err1) {
        NSLog(@"%@", str1);
    } else {
        NSLog(@"%@", err1);
    }
    // 3、格式化字符串。用于将其他类型的数据转化为字符串。用法相当与 NSLog，有类方法和对象方法。
    NSString *str2 = [NSString stringWithFormat:@"%d + %d = %d", 1 , 2, 1 + 2];
    NSLog(@"%@", str2);
    // 4、从 C 语言获得字符串，并将其转化为 OC 字符串
    NSString *str3 = getNSString();
    NSLog(@"%@", str3);
}
// MARK: 字符串的删除（NSString 中没有）
// MARK: 字符串的修改（NSString 中没法修改）
// MARK: 字符串的查找
void search() {
    //OC 中比较两个字符串的方法：1、isEqualToString 2、compare
    NSString *str1 = @"132";
    NSString *str2 = @"123";
    NSString *str3 = @"132";
    NSComparisonResult a = [str1 compare:str3];
    NSLog(@"%ld", a);
}
// MARK: 字符串的其他方法
void others() {

}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 1、NSString 类的构造方法
//        add();
        search();
        others();
    }
    return 0;
}
