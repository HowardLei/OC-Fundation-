#import <Foundation/Foundation.h>
/*
 NSDictionary 类
 1、为什么会出现 NSDictionary 类
    一般存储数据的时候，会经常运用到数组，但是数组中有个致命的缺陷。就是下标不确定，中间一旦删除了某个元素，则查找其他元素需要重新遍历下标来进行确定。
    那么需要一种新的数据存储方式 能够将里面的元素快递的查找出来。
    在存储数据的时候，必须要为这个存储的数据起一个别名。
    别名的作用是确定别名对应的数据。
    所以他查找数据的方式不是通过下标来查找，而是通过起的别名来进行查找。这样可以防止数据因下标变化而变化。
    这种存储数据的方式，叫做“键值对”。
    键：key
    值：value
 2、创建 NSDictionary 类
    (1)、直接创建，创建一个空的 NSDictionary
    NSDictionary *dict = [NSDictionary dictionary];
    (2)、创建一对键值对的 NSDictionary
    NSD
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 1、直接创建一个空 dict （没有实际意义）
        NSDictionary *dict = [NSDictionary dictionary];
        // 2、创建一个含一个键值对的 dict 方法： dictionaryWithObject:value值 forKey:key值
        NSDictionary *dict1 = [NSDictionary dictionaryWithObject:@123 forKey:@"num"];
        // 3、创建一个含多个键值对的 dict 方法： initWithObjects: value值构成的数组 forKeys: key值构成的数组
        NSDictionary *dict2 = [[NSDictionary alloc] initWithObjects:@[@123, @456] forKeys:@[@"yyy", @"hhh"]];
        NSLog(@"%@", dict2);
        NSLog(@"allKeys = %@, allValues = %@", dict2.allKeys, dict2.allValues);
    }
    return 0;
}
