#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // NSString字符串常见用法
        //1.直接创建
        NSString * str1 = @"第一种创建NSString的方法";
        NSLog(@"%@",str1);
        //2.创建一个空字符串，再对其进行赋值
        NSString * str2 = [NSString new];
        str2 = @"第二种创建NSString的方法";
        NSLog(@"%@",str2);
        //3.复制之前的字符串
        NSString * str3 = [[NSString alloc] initWithString:str1];
        NSLog(@"这是我复制的%@",str3);
        //4.格式化创建字符串
        NSString * str4 = [NSString stringWithFormat:@"图片 xxxx %- %02d.jpg",19];//为啥我这个不能修改？
        NSLog(@"%@",str4);
    }
    return 0;
}
