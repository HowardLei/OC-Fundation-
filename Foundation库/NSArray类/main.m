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
NSString *(^myBlock)(BOOL) = ^(BOOL a) {
    if (a){
        return @"相同";
    } else {
        return @"不同";
    }
};
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // NSArray 的创建
        NSArray *arr = @[@123, @456, @789, @13245];
        // 显示整个 NSArray
        NSLog(@"%@", arr);
        // 遍历出单个 NSArray 中的元素
        for (int i = 0; i < arr.count; i++) {
            NSLog(@"%@", arr[i]);
        }
        // 快速遍历 arr 中的元素。（for in 枚举法）注意：这里面的对象类型推荐用 id 。
        for (id i in arr) {
            NSLog(@"%@", i);
        }
        // 显示出数组中的总元素个数
        NSLog(@"%ld", arr.count);
        // 显示出数组的第几个元素。
        // 1、用 C 语言的语法。
        NSNumber *num1 = arr[0];
        NSLog(@"%@", num1);
        // 2、用 OC 的方法访问 objectAtIndex: 下标数
        NSNumber *num2 = [arr objectAtIndex:2];
        NSLog(@"%@", num2);
        // 特别的，如果访问数组的最开始和最后一个元素有一下方法 firstObject lastObjcet
        NSLog(@"%@,%@", arr.firstObject, arr.lastObject);
        // 查找数组中的元素下标
        NSUInteger i = [arr indexOfObject:@123];
        NSLog(@"%ld", i);
        // 判断数组中是否拥有此对象 containsObject: nonnull id 返回值为 BOOL
        BOOL a = [arr containsObject:@123];
        if (a) {
            NSLog(@"有%@的元素", myBlock(a));
        } else {
            NSLog(@"没有%@的元素", myBlock(a));
        }
        // 数组与字符串之间的关系
        // 将数组里面的元素拼接成一个字符串 componentsJoinedByString：参数为分隔符
        NSString *str = [arr componentsJoinedByString:@","];
        NSLog(@"%@", str);
        // 将字符串用指定的分隔符分割成一个数组，每一部分就是一个元素。 方法：componentsSeparatedByString: 参数为分隔符
        NSString *p = @"Beijing/Shanghai/Guangzhou/Shenzhen";
        NSArray * arr1 = [p componentsSeparatedByString:@"/"];
        NSLog(@"%@", arr1);
    }
    return 0;
}
