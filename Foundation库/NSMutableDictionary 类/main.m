#import <Foundation/Foundation.h>
/*
 NSMutableDictionary 类（NSDictionary 子类）（可变字典）
 1、创建：NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:value, keys, nil];（依次写），不能直接写 @{key: object, ...} 因为这是 NSDictionary 类的对象。
 2、增加：方法：- (void)setObject:Value forKey: Key;
    如果添加的 Key 值相同，则后面添加的会替换之前的。
 3、删除：删除指点的键值对：- (void)removeObjectForKey: Key;
        删除所有键值对：- (void)removeAllObjects;
 */
// MARK: 添加键值对
void add() {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:@"wangnima" forKey:@"name"];
    [dict setObject:@"Macintosh" forKey:@"computer"];
    [dict setObject:@"xiaoming" forKey:@"name"];
    for (NSString *key in dict) {
        NSLog(@"key = %@, value = %@", key, dict[key]);
    }
}
// MARK: 删除
void delete() {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"wangnima", @"name", @"NYC", @"city", nil];
    NSLog(@"%@", dict);
    // 删除 city 键以及其对应的值
    [dict removeObjectForKey:@"city"];
    NSLog(@"%@", dict);
    // 删除字典中的所有键值对。
    [dict removeAllObjects];
    NSLog(@"%@", dict);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        add();
        delete();
    }
    return 0;
}
