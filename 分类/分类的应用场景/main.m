#import <Foundation/Foundation.h>
#import "Person.h"
#import "NSObject+sport.h"
#import "NSString+countNum.h"
/*
 分类的应用场景：扩展系统类的方法。（因为假如你创建的大多数的对象都需要此方法，但是系统内没有内置此方法，你就可以创建此分类的非正式协议）
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        p.name = @"wnm124";
        NSLog(@"%d", [p.name countNumberInString:p.name]);
        [p play];
    }
    return 0;
}
