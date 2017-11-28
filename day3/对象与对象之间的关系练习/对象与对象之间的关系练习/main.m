
#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person * zhangsan = [Person new];
        Key * key = [Key new];//不要忘记创建钥匙对象
        zhangsan->_name = @"张三丰";
        zhangsan->_key = key;//由于这个在钥匙函数中没有声明NSString,所以写的时候不用写'@""'
        [zhangsan openTheDoorWithKey:key];
    }
    return 0;
}
