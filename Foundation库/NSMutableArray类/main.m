#import <Foundation/Foundation.h>
/*
 NSMutableArray 类，继承自 NSArray 类
 1、他是可变数组：只能存储 OC 对象，每1个元素都是紧密相连。
 2、他相对父类 NSArray 做的扩展，其中数组中的元素可以动态的新增和删减\
    所以：NSArray 数组一旦创建，绝对无法修改。
         NSMutableArray 数组，元素可以删除，其他用法一样。
 */
// MARK: 数组的增加
void add() {
    // 1、NSMutableArray 数组的创建 注意：他直接 alloc init 是有意义的，因为他是可变数组
    NSMutableArray *arr1 = [[NSMutableArray alloc] init];
    NSArray *arr = @[@"UNIX", @"Ubentu", @"macOS", @"Windows"];
    // a)添加单元素 addObject: 对象
    [arr1 addObject:@"iOS"];
    // b)从别的数组中添加元素 addObjectsFromArray: 数组名
    [arr1 addObjectsFromArray:arr];
    // c)添加元素在某个特定的位置 insertObject:@"Android" atIndex: 元素添加到数组所在的位置
    [arr1 insertObject:@"Android" atIndex:arr1.count];
    // 注意：在添加的时候，绝对不能是直接像 NSArray 那样这么创建 NSMutableArray *temp = @[@"123"]; 因为这么创建的数组是 NSArray 类的数组。判断方法：先输入@，再按 ese，发现里面出现 @[objects, ...] 他的返回值为 NSArray 。
    NSLog(@"arr1数组的元素为%@，数组中一共有%ld个元素", arr1, arr1.count);
}
// MARK: 数组的删除
void remove() {
    NSArray *arr = @[@"UNIX", @"Ubentu", @"macOS", @"Windows"];
    NSMutableArray *varArr = [NSMutableArray arrayWithArray:arr];
    // a) 删除数组中的指定元素 方法：removeObject: 元素名
    [varArr removeObject:@"Windows"];
    NSLog(@"%@", varArr);
    // b) 按照数组下标删除元素 方法：removeObjectAtIndex: 元素在数组中的下标
    [varArr removeObjectAtIndex:1];
    NSLog(@"%@", varArr);
    // c) 删除数组中的最后一个元素 方法：removeLastObject
    [varArr removeLastObject];
    NSLog(@"%@", varArr);
    // d) 删除数组中的所有元素 方法：removeAllObjects
    [varArr removeAllObjects];
    NSLog(@"%@", varArr);
}
// MARK: 数组中元素的修改
void replace() {
    NSArray *arr = @[@"UNIX", @"Ubentu", @"macOS", @"Windows", @"FreeBSD"];
    NSArray *arr1 = @[@123, @456, @789, @4542];
    NSMutableArray *varArray = [NSMutableArray arrayWithArray:arr];
    // a)替换指定位置的元素 方法：replaceObjectAtIndex:替换数组元素的下标 withObject:新元素
    [varArray replaceObjectAtIndex:3 withObject:@"iOS"];
    NSLog(@"%@", varArray);
    // b)替换一个范围内的数组内容 方法：replaceObjectsInRange:需要被替换的数组的范围 withObjectsFromArray:替换成那部分数组 range:替换数组部分的范围（这个参数是可选项，如果是范围是这个新数组，则不需要填写）
    [varArray replaceObjectsInRange:NSMakeRange(0, 2) withObjectsFromArray:arr1 range:NSMakeRange(2, 2)];
    NSLog(@"%@", varArray);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        add();
//        remove();
        replace();
    }
    return 0;
}
