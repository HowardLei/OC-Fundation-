//让1个人拥有1本书，输出人的信息
//让1个年龄10岁的人读书。
#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //MARK:1个人拥有1本书，输出人的信息
        Person * zhangsan = [Person new];
        Book * _book = [Book new];
        zhangsan->_name = @"张三丰";
        zhangsan->_book = _book;//这是调用上边的——book对象
        [zhangsan getABook:_book];
        //MARK:10岁小孩读书
        Person * lisi = [Person new];
        lisi->_name = @"李四";
        lisi->_age = 10;
        Book * b = [Book new];
        b->_name = @"小王子";
        [lisi ReadABook:b];
    }
    return 0;
}
