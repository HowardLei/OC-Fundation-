#import "Student.h"
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student * s = [[Student alloc]init];
        Student * s1 = [[Student alloc]init];
        NSLog(@"第一名学生%d岁，学号为:%d",s.age,s.no);
        NSLog(@"第二名学生%d岁，学号为:%d",s1.age,s1.no);
    }
    return 0;
}
