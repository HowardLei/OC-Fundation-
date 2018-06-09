#import <Foundation/Foundation.h>
#import "Person.h"
/*
 NSArray基础方法
 1、简介：NSArray 是 founda 框架下的一个类，用来储存多个数据，具备数组的功能。
 2、特点：1）只能储存 OC 对象，因为元素的类型是 id
        2）长度固定，一旦创建，无法修改。
        3）每个元素都是紧密相连的，每个元素都有自己的下标。
 3、基础创建方式 NSArray *arr = [[NSArray alloc] init]; 这种创建方式没任何意义，因为元素的个数为0
 4、创建单元素数组 NSArray *arr = [NSArray arrayWithObject:对象];
 5、创建多元素数组 a) NSArray *arr = [NSArray arrayWithObjects:@"123", @"456", @"789", nil]; 这种创建方式不要忘记最后加 nil。否则系统会报错，认为元素没添加完。
                b) NSArray *arr = @[objects, ...]; 这种创建方式不用在后边加 nil 。因为 nil 本身代表 0 （OC 对象字面值）值的类型为 int 型。
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *arr = @[@123, @456];
        NSLog(@"%@", arr);
    }
    return 0;
}
