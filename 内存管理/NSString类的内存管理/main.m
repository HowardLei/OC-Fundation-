#import <Foundation/Foundation.h>
// 查看相同字符串内容的引用计数
void demo1(){
    // 创建字符串
    NSString *str1 = @"王尼玛";
    NSString *str2 = [NSString stringWithString:@"王尼玛"];
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
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        demo1();
    }
    return 0;
}
