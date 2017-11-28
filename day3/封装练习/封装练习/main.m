/*
 1.设计1个学生类 属性:
 年龄：0~120 else默认20
 姓名：长度不能小于2 并且不能为“毛泽东”，“习近平”
 */
#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student * s = [Student new];
        [s setAge:15];
        NSLog(@"%d",[s Age]);//NSLog输出的是get方法的名字
        [s setName:@"哈哈哈"];
        NSLog(@"%@",[s Name]);
        [s setScore:124];
        NSLog(@"%d",[s Score]);
    }
    return 0;
}
