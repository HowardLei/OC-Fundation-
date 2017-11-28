#import "Student.h"
#import <Foundation/Foundation.h>
#import "Zhongjie.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student * zhangsan = [Student new];
        Zhongjie * zj = [Zhongjie new];
        [zhangsan setName:@"张三丰"];
        [zhangsan searchHouseWithZhongjie:zj];
    }
    return 0;
}
