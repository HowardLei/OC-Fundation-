/*
 - (NSString *)description
 {
 return [NSString stringWithFormat:@"%@",_bookName];  这就是用来辅助NSLog输出的例子,如果没有的话，就会打印其地址
 }
 1.所有的类,都有description方法
 2.作用:辅助NSLog输出.
 <Book: 0x100306750>
 类名:对象的地址
 */
#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
    //创建一个学生对象
        Student * zhangsan = [Student new];
    //创建一本书
        Book * a = [Book new];
        [zhangsan setName:@"张三丰"];
        [zhangsan setNum:230402340];
        [zhangsan setBook:a];
        [a setBookName:@"鲁宾逊漂流记"];
        [a setBookAuthor:@"丹尼尔·笛福"];
        NSLog(@"%@带着%@，作者是%@",[zhangsan Name],[zhangsan Book],[a Author]);
    }
    return 0;
}
