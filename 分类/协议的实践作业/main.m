#import <Foundation/Foundation.h>
#import "CarePerson.h"
#import "Baby.h"
/*
 需求：用代理的设计模式，为婴儿找一个可以照顾它的东西。
 Baby 属性：1）姓名
           2）年龄
           3）照顾他的人
      行为：1）哭
           2）吃奶
           3）睡觉
           4）犯困的行为
    
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Baby *baby1 = [[Baby alloc] init];
        baby1.age = 1;
        baby1.name = @"小宝贝";
        CarePerson *babysister = [[CarePerson alloc] init];
        baby1.person = babysister;
        [baby1 cry];
        [baby1 fellSleepy];
    }
    return 0;
}
