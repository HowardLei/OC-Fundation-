w#import <Foundation/Foundation.h> //#import相当于是#include的加强版，单独使用这个指令时 不会造成重复包含，因为他包含了预编译
    //'<>' 是引用系统内的框架，查找顺序：编译器文件夹 --> 系统文件夹 --> 都没有的话查找失败
    //'""' 是用来引用用户文件 查找顺序： 当前文件夹 --> 编译器文件夹 --> 系统文件夹 --> 都没有的话查找失败
    /* #import 等价代码
     #ifndef mmm_h
     #define mmm_h   这两行相当于一个预编译指令
     
     #include <stdio.h>
     
     */
int main(int argc, const char * argv[]) //所有程序的出入口都是main函数
{
    @autoreleasepool //这个是自动释放池，防止出现内存泄漏。 @可以做标识符，也是NSString的标识符。
        {
        NSLog(@"Hello,World!"); //NSLog 相当于Swift里面的Print 作用
            /*  
             关于NSLog
                1.C语言中的printf的增强版
                2.作用：打印数据
                3.增强方面：打印时间、标题、进程号、线程号 自动换行（不用像在C中最后加 \n）
                4.格式：NSLog(@"") 主要@一定要放在‘“”’之前，代表的是OC字符串
             */
            int a = 10;
            NSLog(@"我们班一共有%d个人",a); //引用也与C一样 %d代表引用格式
            NSString *eee = @"我爱这个世界"; //NSString是用来存储OC字符串的类型，比C的字符串多保存指针变量(即地址)
            NSLog(@"%@",eee);//OC字符串不能用%s打印，得用%@打印 而且OC的字符串不能用printf打印
            NSLog(@"曼城%@",@"牛逼");//%@也可以在后边进行标注
            /*
             %代表格式字符串，后面的字母是根据不同的数据类型用不同的字母表示
             其中常用类型
                %d 十进制整数(int)
             　　%ld 十进制整数(long)
             　　%f 十进制浮点数(float)
             　　%lf 十进制浮点数(double)
                %s C字符串
                %@ OC字符串
            */
        }
    return 0;
}
//注意：OC完全兼容C,所以在.m的文件下也可以写C的程序
