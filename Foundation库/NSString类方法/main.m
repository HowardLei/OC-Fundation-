#import <Foundation/Foundation.h>
// 关于字符串，先去学习基础的代码，等到后边在应用的时候，需要啥再去学习新的。然后总结在一个文件中
// 注意：NSString 类是不可变字符串
NSString *getNSString() {
    char str[256];
    NSLog(@"请输入一个字符串");
    fgets(str, 255 * sizeof(char), stdin);
    return [NSString stringWithUTF8String:str];
}
NSString *(^myBlock)(BOOL) = ^(BOOL a) {
    if (a) {
        return @"真";
    } else {
        return @"假";
    }
};
// MARK: 字符串的添加
void append() {
    // 1、从文本文件中获取字符串
    //NSString *str = NSString stringWithContentsOfFile:路径地址（注意：里面是NSString类型） encoding:编码格式(代码) error:NSError类型的二级指针
    // 先创建一个 err 对象
    NSError *err;
    // 这个地方为啥 error 是在用二级指针，因为这个方法需要判断这个文件到底存在不存在。如果存在，则 err 判断为0，则在下边判断的时候加个非即为真。否则输出错误的信息。
    NSString *str = [NSString stringWithContentsOfFile:@"/Users/jyz/Desktop/a.m" encoding:NSUTF8StringEncoding error:&err];
    if (!err) {
        NSLog(@"%@", str);
    } else {
        NSLog(@"%@", err);
    }
    // 2、通过 URL 获取字符串（URL:统一资源定位符,用于定位网上的资源。构成：协议://主机:端口/路径?参数）
    NSURL *p = [[NSURL alloc] initWithString:@"https://www.baidu.com/"];
    NSError *err1;
    NSString *str1 = [[NSString alloc] initWithContentsOfURL:p encoding:NSUTF8StringEncoding error:&err1];
    if (!err1) {
        NSLog(@"%@", str1);
    } else {
        NSLog(@"%@", err1);
    }
    // 3、格式化字符串。用于将其他类型的数据转化为字符串。用法相当与 NSLog，有类方法和对象方法。
    NSString *str2 = [NSString stringWithFormat:@"%d + %d = %d", 1 , 2, 1 + 2];
    NSLog(@"%@", str2);
    // 4、从 C 语言获得字符串，并将其转化为 OC 字符串
    NSString *str3 = getNSString();
    NSLog(@"%@", str3);
    // 与它相对的是将 OC 的字符串转换为 C 语言的字符串。（注意：接收的时候是用 const char *来接收）
    const char *str4 = str3.UTF8String;
    NSLog(@"%s", str4);
}
// MARK: 字符串的删除（NSString 中没有）
// MARK: 字符串的修改（NSString 中没法修改）
// MARK: 字符串的查找
void search() {
    NSString *str1 = @"123";
    NSString *str2 = @"456";
    NSString *str3 = @"abc";
    NSString *str4 = @"ABC";
    NSString *str5 = @"https://www.baidu.com/";
    NSString *str6 = @"/Users/jyz/Desktop";
    // A、OC 中比较两个字符串的方法：1、isEqualToString 方法 2、compare 方法
    // 1、用 isEqualToString 方法 返回值为 BOOL 类型 （注意：BOOL 类型中 1 为真，0 为假）
    BOOL a = [str1 isEqualToString:str2];
    NSLog(@"%@", myBlock(a));
    // 2、用 compare 方法比较，他的比较方法是字典比较法，就是将字符串的每个元素的 ASCII 码进行比较，如果出现不同，则停止比较。返回值为 NSComparisonResult 类型（它本身是枚举）注意：如果后边有附加条件的话，直接加 options: 后边有参数。
    NSComparisonResult b = [str1 compare:str2];
    NSComparisonResult c = [str3 compare:str4 options:1];
    NSLog(@"%ld", c);
    NSLog(@"%ld", b);
    // B、查找字符串中是不是有前缀后缀。查前缀  hasPrefix 方法，查后缀 hasSuffix 方法。返回值同样是 BOOL
    BOOL d = [str5 hasPrefix:@"https://"];
    BOOL e = [str6 hasSuffix:@"Desktop"];
    NSLog(@"%@,%@", myBlock(d), myBlock(e));
    // C、在字符串中搜索字符串 rangeOfString ，返回值为：NSRange 类型（NSRange 本事是结构体，有 location 值：即子字符串在主字符串中第1次出现的下标，length 值：即匹配到了多少个长度的字符）。注意：默认从前往后搜，如果从后往前搜，那就在后面的参数上加option :2
    // 如果需要查找的字符串在所查的字符串中不存在，则他的 location 值为 NSNotFound。（即 unsigned long 的最大值）, length 值为 0
    NSRange f = [str5 rangeOfString:@"baidu"];
    NSLog(@"baidu在str5这个字符串的位置为：%lu，长度为：%lu", f.location, f.length);
    NSRange g = [str6 rangeOfString:@"Desktop" options:2];
    NSLog(@"%lu", g.length);
    // D、字符串的截取
    NSString *str7 = @"你看看这个世界";
    // 从第几个开始截取 方法：substringFromIndex: 参数输入的即为从第几个开始一直截取到字符串结束的子字符串。
    NSString *subStr1 = [str7 substringFromIndex:2];
    // 从头截取，一直到第几个 方法：substringToIndex: 参数输入截取的字符数
    NSString *subStr2 = [str7 substringToIndex:2];
    // 从中间截取 方法：substringFromRange 参数：NSRange 。
    NSString *subStr3 = [str7 substringWithRange:NSMakeRange(2, 3)];
    NSLog(@"%@,%@", subStr2, subStr1);
    NSLog(@"%@", subStr3);
    // E、字符串的替换 方法：stringByReplacingOccurrencesOfString:需要替换部分的字符串 withString:替换部分 的字符串。（注意：新串在方法的返回值中，需要用一个字符串进行接收）
    NSString *str8 = @"我爱北京天安门";
    str8 = [str8 stringByReplacingOccurrencesOfString:@"北京天安门" withString:@"广州"];
    NSLog(@"%@", str8);
    // F、字符串的类型转换。需要转换成什么类型就写xxxValue.（注意：从头开始转换，能转换多少是多少，到遇到不能转换的时候就停止转换。）
    NSString *str9 = @"123541";
    NSString *str10 = @"1234.23415";
    int num1 = str9.intValue;
    double num2 = str10.doubleValue;
    NSLog(@"%d, %lf", num1, num2);
}
// MARK: 字符串的其他方法
void others() {
    // 1、查看字符串的长度 xxx.length
    NSString *str1 = @"123";
    NSLog(@"%lu", str1.length);
    // 2、将字符串中的大写转小写字母，小写转大写字母。方法：uppercaseString lowercaseString（注意：转换完的字符串是返回值，需要用字符串来接收它。不是调用了方法就会转换的）
    NSString *str2 = @"i love peking";
    str2 = [str2 uppercaseString];
    NSLog(@"%@", str2);
    str2 = [str2 lowercaseString];
    NSLog(@"%@", str2);
    // 3、去除字符串中的前后空格或者是特殊符号 方法：stringByTrimmingCharactersInSet:(NSCharacterSet *)（注意：这个参数是 NSCharacterSet 类，里面有很多字符集，需要去掉啥自己选择即可）。
    NSString *str3 = @"   asdfaafd   ";
    str3 = [str3 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSLog(@"%@", str3);
    // 注意：在去除这个字符串的首尾指定字符串的时候，只要含字符串中的字符就可以去除，不区分顺序。
    NSString *str4 = @"sdfsaffgfkjasdkfjasd aslkdiuioqawfklasdfh opsdffak";
    str4 = [str4 stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"asdfk"]];
    NSLog(@"%@", str4);
    // 4、去除首尾字符串的大/小写字母。
    NSString *str5 = @"asfdjklj SAFJKLJGAL LKGA sjbfkdjkgl";
    str5 = [str5 stringByTrimmingCharactersInSet:[NSCharacterSet lowercaseLetterCharacterSet]];
    NSLog(@"%@", str5);
    NSString *str6 = @"SDGFJWASJKLGzsdfghasfdASF";
    str6 = [str6 stringByTrimmingCharactersInSet:[NSCharacterSet uppercaseLetterCharacterSet]];
    NSLog(@"%@", str6);
}
// MARK: NSRange 结构体的补充。
void NSRangeExtension() {
    // 先创建一个 NSRange 的结构体，注意：NSRange 是 Foundation 框架下定义的结构体。
    NSRange a = {3, 4};
    // 为 a 赋值有一下五种方法
    // 1、点操作符赋值
    a.location = 300; a.length = 20;
    // 2、初始化的时候就赋值
    // 3、通过 NSMakeRange 方法赋值
    a = NSMakeRange(230, 213);
    // 4、初始化赋值方法2
    NSRange b = {.location = 7, .length = 29};
    // 在输出 NSRange 的数据的时候，可以先将其转换为 NSString 类型，再进行输出。调用 NSStringFromRange 函数
    NSLog(@"%@", NSStringFromRange(a));
    NSLog(@"%@", NSStringFromRange(b));
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 1、NSString 类的构造方法
        append();
//        search();
        others();
//        NSRangeExtension();
    }
    return 0;
}
