#import <Foundation/Foundation.h>
/*
 NSNumber类
 由于 NSArray 类只能包装 OC 对象，不能存储基础数据类型，所以需要将基本数据类型转换成 OC 对象再储存在 NSArray 里面
 而 NSNumber 类就是包装基础数据类型的类
 1、创建一个 NSNumber 类： NSNumber *num = [[NSNumber alloc] init];
 2、设置值：a)创建的时候设置
            NSNumber * num = [[NSNumber alloc] initWith(需要的类型):数据];
          b) init 完以后设置 num = @数据;
 3、将 NSNumber 类包装的对象中的内容转换成基础数据类型 转换成啥数据类型就是 xxxValue
 4、将基础数据类型的数据包装成 OC 对象，在将其存储进 NSArray 中即可
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test1();
        // 1、创建一个 NSNumber 对象
        NSNumber *num = [[NSNumber alloc] init];
        // 2、设置值
        num = @123.325;
        NSLog(@"%@", num);
        // 3、将 NSNumber 类包装的对象转换为基础数据类型
        NSLog(@"%lf", num.doubleValue);
        // 4、将基础数据类型的数据装进 NSArray 并且遍历出来
        int a[10];
        for (int i = 0; i < 10; i++) {
            a[i] = i;
        }
        NSMutableArray *arr = [NSMutableArray array];
        for (int i = 0; i < 10; i++) {
            [arr addObject:@(a[i])];
        }
        NSArray *arr1 = [NSArray arrayWithArray:arr];
        for (NSNumber *num in arr1) {
            NSLog(@"NSArray数组中的第%d个元素为：%@", num.intValue, num);
        }
    }
    return 0;
}
