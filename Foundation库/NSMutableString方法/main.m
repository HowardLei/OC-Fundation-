#import <Foundation/Foundation.h>
/*
 关于 NSMutableString
 1、NSMutableString 是继承自 NSString 类的。
 2、NSMutableString 是在 NSString 基础上做的扩展。
    存储在 NSString 上的字符串数据可以更改，具有可变性。
    每次修改是在原有的基础上进行修改，不会在创建新对象。
 3、使用的方法，平常使用的时候，还是推荐使用 NSString 。
    在进行大量拼接的时候，再去考虑使用 NSMutableString 。
 */
// MARK: 字符串的增加
void add() {
    // 1、往 NSMutableString 中添加内容 appendString 方法
    NSMutableString *str1 = [NSMutableString string];
    [str1 appendString:@"123"];
    [str1 appendString:@"456"];
    NSLog(@"%@", str1);
    // 2、添加任意格式的内容进入字符串 appendFormat 方法
    NSMutableString *str2 = [NSMutableString string];
    for (int i = 0; i < 10; i++) {
        [str2 appendFormat:@"%d", i];
    }
    NSLog(@"%@", str2);
    // 3、添加字符串在字符串某个区间 insertString:字符串 atIndex:字符串的下标。他会将字符串添加到下标左边的区域内。
    NSMutableString *str3 = [NSMutableString string];
    [str3 appendString:@"王尼玛"];
    [str3 insertString:@"123" atIndex:0];
    NSLog(@"%@", str3);
}
// MARK: 字符串的删除
void delete() {
    // 方法：deleteCharactersInRange:(NSRange) 。删除的范围由 NSRange 决定。
    NSString *str = @"王尼玛死大头";
    NSMutableString *varStr = [NSMutableString stringWithString:str];
    [varStr deleteCharactersInRange:NSMakeRange(0, 3)];
    NSLog(@"%@", varStr);
}
// MARK: 字符串的修改
void alter() {
    // 1、修改某个区间的字符串: replaceCharactersInRange:字符串区间 withString:所需修改字符串的内容
    NSString *str = @"12345";
    NSMutableString *newStr = [NSMutableString stringWithString:str];
    NSLog(@"修改前的字符串为：%@", newStr);
    [newStr replaceCharactersInRange:NSMakeRange(0, 5) withString:@"I love Melodybaby"];
    NSLog(@"修改后的字符串为：%@", newStr);
    // 2、替换某个区间的字符串。replaceOccurrencesOfString:需要替换的字符串 withString:替换成什么字符串 options:比较选项 range:替换的范围
    [newStr replaceOccurrencesOfString:@"Melody" withString:@"12345" options:1 range:NSMakeRange(0, newStr.length)];
    NSLog(@"%@", newStr);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        add();
        delete();
        alter();
    }
    return 0;
}
