#import <Foundation/Foundation.h>
#import "Person.h"
/*
 协议：
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        [p jump];
        [p eat];
    }
    return 0;
}
