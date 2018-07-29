#import <Foundation/Foundation.h>
// 查看最大最小值调用 Limits.h 头文件即可，里面有定义好的最大值的宏
#import <limits.h>
#import "Boy.h"
#import "Girl.h"
/*
 需求：男孩子找女朋友
 要求：
    必须会：1）洗衣服
           2）做饭
    优先：
    如果有一份过万的工作。
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Boy *boy1 = [[Boy alloc] init];
        boy1.age = 18;
        boy1.name = @"王尼玛";
        boy1.money = INT32_MAX;
        Girl *girl1 = [[Girl alloc] init];
        girl1.age = 18;
        girl1.name = @"哈哈哈";
        girl1.boy = boy1;
        [boy1 talkLoveWith:girl1];
    }
    return 0;
}
