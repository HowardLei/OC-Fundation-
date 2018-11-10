#import <Foundation/Foundation.h>
#import "show.h" //调用同目录下文件调头文件！！！
#import "Student.h"
void test(){
    printf("This is a subfunction. \n");
}
@interface Person : NSObject
{
    @public
    int _age;
}
- (void)show;
@end

@implementation Person

- (void)show {
    NSLog(@"年龄为%d", _age);
}

@end
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        test();//OC调用C中的函数是可行的
//        testshow();//调用本地C语言文件也可以
        Person *p = [Person new];
        p->_age = 12;
        [p show];
        Student *s1 = [Student new];
        s1->_ID = @"123431255";
        s1->_score = 99;
        [s1 showID];
        NSLog(@"%@", [s1 compareScoreWithStudent:s1]);
    }
    return 0;
}
