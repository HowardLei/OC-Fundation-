#import "Hero.h"
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Hero * h = [[Hero alloc]init];
        [h initWithName:@"张三丰"];
    }
    return 0;
}
