#import <Foundation/Foundation.h>
#import "Person.h"
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
    NSDictionary *dict1 = [NSDictionary dictionaryWithObject:@123 forKey:@"num"];
    (3)、直接创建一个 NSDictionary 对象
    NSDictionary *dict = @{key: object, ...};
 3、访问字典中的元素
 (1)、取出字典中的所有键或值 ：allKeys，allValues
 (2)、遍历数组的元素：for in 循环、Block 方法
 (3)、字典的文件方法。（读、写）
 4、对字典里面的 Key 值进行排序
 (1)、块方法，根据 value 的长度进行排序，如果 value1 的长度比 value2 的短的话，则进行倒序排列，否则按升序排列。如果长度相同，则根据遍历顺序进行排序，即先遍历到的在前面。
 (2)、
 5、
 */
// MARK: 字典的创建
void create() {
    // 1、直接创建一个空 dict （没有实际意义）
    NSDictionary *dict1 = [NSDictionary dictionary];
    // 2、创建一个含一个键值对的 dict 方法： dictionaryWithObject:value值 forKey:key值
    NSDictionary *dict2 = [NSDictionary dictionaryWithObject:@123 forKey:@"num"];
    // 3、创建一个含多个键值对的 dict 方法： initWithObjects: value值构成的数组 forKeys: key值构成的数组
    NSDictionary *dict3 = [[NSDictionary alloc] initWithObjects:@[@123, @456] forKeys:@[@"yyy", @"hhh"]];
    // 4、一般创建方式： NSDictionary *dict = @{key: object, ...};即一个键，一个值。
    NSDictionary *dict4 = @{@"key": @"value"};
    NSLog(@"dict1 = %@, dict2 = %@, dict3 = %@, dict4 = %@", dict1, dict2, dict3, dict4);
}
// MARK: 字典的查找
void search() {
    NSDictionary *dict = @{@"num": @123, @"name": @"wangnima"};
    // 1、取出单个键对应的值：写法类似于数组，但是下标是 key 值： dict[键名] 等价方法：objectForKey:键名
    NSLog(@"%@", dict[@"name"]);
    // 2、计算出所有键值对的数量 方法：count 方法
    NSUInteger num = dict.count;
    NSLog(@"dict.count = %lu", num);
    // 3、取出字典中的所有键与所有值 方法：allKeys, allValues 返回值均为 NSArray
    NSArray *allDictKeys = dict.allKeys;
    NSArray *allDictValues = dict.allValues;
    NSLog(@"allKeys = %@,allValues = %@", allDictKeys, allDictValues);
    // 4、遍历字典中的所有元素（注意：不能用普通的 for 循环，因为字典的下标不是数字，是键值。）用 for in 循环，先遍历键，通过键的下标遍历值。
    for (id key in dict) {
        NSLog(@"key = %@, value = %@", key, dict[key]);
    }
    NSLog(@"-------");
    // 5、用块遍历字典 方法：enumerateKeysAndObjectsUsingBlock:指定的代码块
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"key = %@, value = %@", key, obj);
    }];
    // 6、将字典中的数据保存在文件中 方法：writeToFile: 文件路径 atomically: 默认写 NO
    [dict writeToFile:@"/Users/jyz/Desktop/abc.plist" atomically:NO];
    // 7、从文件中读取字典中的数据 方法：dictionaryWithContentsOfFile: 文件路径
    NSDictionary *newDict = [NSDictionary dictionaryWithContentsOfFile:@"/Users/jyz/Desktop/abc.plist"];
    NSLog(@"%@", newDict);
}
// MARK: 字典的排序（对 KEY 值进行排序）
void keySort() {
    NSDictionary *dict = @{@"num": @"one",
                           @"name": @"wangnima",
                           @"School": @"Oxford",
                           @"Property": @"nonatomic"
                           };
    NSArray *arr1 = [dict keysSortedByValueUsingComparator:^NSComparisonResult(NSString *key1, NSString *key2) {
        if ([key1 compare:key2] == -1) {
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    }];
    // FIXME:为什么这个地方比较的是 value 的长度？
    NSArray *arr2 = [dict keysSortedByValueUsingComparator:^NSComparisonResult(NSString *value1,  NSString *value2) {
        if ([value1 length] < [value2 length]) {
            return NSOrderedAscending;
        }
        if ([value1 length] > [value2 length]) {
            return NSOrderedDescending;
        }
        return NSOrderedSame;
    }];
    for (NSString *elements in arr1) {
        NSLog(@"key = %@, value = %@", elements, dict[elements]);
    }
//    [arr writeToFile:@"/Users/jyz/Desktop/abc.plist" atomically:NO];
}
// MARK: 字典的存储的方法
void store() {
    /*
     在字典存储到内存的时候，不是按照输入顺序存储的，是将 key 的值通过哈希算法计算得到的值，将这个值存储在对应内存的下标处。
     在取值的时候，同样根据 key 经过一个 哈希算法进行计算得到下表结果，然后直接找到这个下标并且取出数据即可。
     
     与 NSArray 对比
     NSArray 在存储数据的时候，将数据一个个挨着存储在数组当中。
     而字典是先经过哈希算法将数据存储在对应下标处。
     读写效率
     写方面：NSArray 快（因为直接按照顺序写）
     读方面：看情况
            如果是查找所有的值，那么 NSArray 快（不用经过哈希算法）
            如果是查找个别值，那么字典快。
     */
    Person *p1 = [[Person alloc] initWithName:@"Jack1"];
    Person *p2 = [[Person alloc] initWithName:@"Jack2"];
    Person *p3 = [[Person alloc] initWithName:@"Jack3"];
    Person *p4 = [[Person alloc] initWithName:@"Jack4"];
    Person *p5 = [[Person alloc] initWithName:@"Jack5"];
    // 创建一个数组，将对象全部保存在数组中
    NSArray *arr = @[p1, p2, p3, p4, p5];
    for (id person in arr) {
        if ([[person name] isEqualToString:@"Jack3"]) {
            NSLog(@"Find it");
            break;
        } else {
            NSLog(@"404");
        }
    }
    NSDictionary *dict = @{p1.name: p1,
                           p2.name: p2,
                           p3.name: p3,
                           p4.name: p4,
                           p5.name: p5
                           };
}
// MARK: 字典的持久化（将字典中的数据转换到文件中）
void writeInFile() {
    NSDictionary *dict = @{@"name": @"wangnima",
                           @"city": @"NYC",
                           @"college": @"MIT"
                           };
    BOOL a = [dict writeToFile:@"/Users/apple/Desktop/dict.plist" atomically:NO];
    if (a == YES) {
        NSLog(@"Success");
    } else {
        NSLog(@"Error");
    }
}
// MARK: 从文件中得到字典数据
void readFromFile() {
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:@"/Users/apple/Desktop/dict.plist"];
    NSLog(@"%@", dict);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        create();
        search();
//        keySort();
//        store();
//        readFromFile();
    }
    return 0;
}
