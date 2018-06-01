#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //1.NSString在纯英文的字符串数量 在length方法下有几个字母就是几个字符串
        NSString *str1 = @"avc";
        NSLog(@"str1字符串的长度为%ld",[str1 length]);
        //2.NSString在纯中文的字符串数量 在length方法下有几个汉字就是几个字符串
        NSString *str2 = @"张三";
        NSLog(@"str2字符串的长度为%ld", [str2 length]);
        //3.NSString在中英文结合环境下的字符串数量,他的总数为汉字数加字母数再加空格数
        NSString *str3 = @"你真是个smart boy";
        NSLog(@"str3字符串的长度为%ld", [str3 length]);
        //4.在C中字符串长度计算
        char *name = "张三";
        printf("张三在C中长为%ld \n",strlen(name));//在c中，一个汉字长度为3，一个英文长度为1
    }
    return 0;
}
