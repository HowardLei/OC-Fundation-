#import <Foundation/Foundation.h>
/*
 需求：创建一个人，一个学生，一个老师，一个上帝
 上帝有一个杀人方法。（今天杀学生，明天杀老师）
 */
#import "God.h"
#import "Person.h"
#import "Student.h"
#import "Teacher.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        God *g = [[God alloc] init];
        Person *s = [[Student alloc] init];
        Person *t = [[Teacher alloc] init];
        [g killWithPerson:s];
        [g killWithPerson:t];
    }
    return 0;
}
