#import <Foundation/Foundation.h>
#import "Girl.h"
#import "Phone.h"
/* 
 1个女孩,让她有一部手机.
 1个女孩用手机给她男朋友打电话.
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Girl * g = [Girl new];//创建一个女孩
        Phone * phone = [Phone new];
        g->_name = @"张三";
        g->_phone = phone;
        NSLog(@"女孩的手机是%@",g->_phone);
        [g makeACallWithPhone:phone];
    }
    return 0;
}
