#import <Foundation/Foundation.h>
#import "Person.h"
// MARK: 查看相同字符串内容的引用计数
void demo1() {
    // 创建字符串
    NSString *str1 = @"王尼玛";
    NSString *str2 = [NSString stringWithString:str1];
    NSString *str3 = [NSString stringWithFormat:@"%@", str1]; //FIXME: 为什么这里只要写中文，他的 retainCount 就是 1？
    NSString *str4 = [NSString stringWithUTF8String:"iOS"];
    NSString *str5 = [[NSString alloc] initWithFormat:@"王尼玛"];
    NSString *str6 = [[NSString alloc] initWithString:@"王尼玛"];
    //显示各个字符串的 retainCount
    NSLog(@"str1.retainCount = %lu, str1 的地址是: %p", str1.retainCount, str1);
    NSLog(@"str2.retainCount = %lu, str2 的地址是: %p", str2.retainCount, str2);
    NSLog(@"str3.retainCount = %lu, str3 的地址是: %p", str3.retainCount, str3);
    NSLog(@"str4.retainCount = %lu, str4 的地址是: %p", str4.retainCount, str4);
    NSLog(@"str5.retainCount = %lu, str5 的地址是: %p", str5.retainCount, str5);
    NSLog(@"str6.retainCount = %lu, str6 的地址是: %p", str6.retainCount, str6);
}
// MARK: 字符串引用计数问题
/*
 分两种情况
 1、当存储在常量区时候，由于数据是不允许被回收的，所以引用计数为 unsigned long 的最大值。
 2、当存储在堆区的时候，引用计数器默认为 1。
 3、如果对象是浅拷贝的话，会将引用计数器加 1、如果是深拷贝的话，则新拷贝的引用计数器为 1。
 */
void demo2() {
    Person *p = [[Person alloc] init];
    NSMutableString *a = [NSMutableString stringWithString:@"wangnima"];
    p.name = a;
    [a appendFormat:@"wer"];
    NSLog(@"name = %@", p.name);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        demo1();
        demo2();
//        NSString *str = [[NSString alloc] initWithFormat:@"王尼玛"];
//        NSLog(@"%lu", str.retainCount);
    }
    return 0;
}
