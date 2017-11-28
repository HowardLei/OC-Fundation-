//一般创建方法
#import <Foundation/Foundation.h>
#import "DogSon.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        DogSon * d = [[DogSon alloc]initWithName:@"旺财" andAge:1];
        NSLog(@"%@",d);
    }
    return 0;
}
