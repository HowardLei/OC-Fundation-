#import <Foundation/Foundation.h>
#import "NSDate+newProperty.h"
/*
 NSDate 类是负责处理日期类数据
 1、显示当前时间
    NSDate *date = [NSDate date];
 2、将 NSDate 与 NSString 互相转化
    中间通过日期格式化对象来进行转换。（注意：是 NSDateFormatter 类，别写成 NSFormatter 类）
    注意：在统一格式化的时候，一定要将 formatter 制定好格式
    YYYY 代表年 设置的时候代码上写了几位就设置成几位
    MM 代表月份
    dd 代表日
    HH 代表时间
    mm 代表分
    ss 代表秒
 3、时间计算
 4、得到 NSDate 各个部分
    1）NSDate 并没有直接的属性。需要你添加分类来建立这些属性
        在获得的时候，需要 1、将日期对象转换成日历对象，通过日历对象来获得里面的数据
        这里面的数据应该存放在 NSDate 中间。
*/
// MARK: 时间计算总结
void demo1() {
    // 1、创建一个 NSDate 对象，对象里面的数据即为当前日期。
    NSDate *date1 = [NSDate date];
    NSLog(@"%@", date1);
    // 2、再创建一个 NSDate 对象，存储 60 s以后的时间。
    NSDate *date2 = [NSDate dateWithTimeIntervalSinceNow:60];
    NSLog(@"%@", date2);
    // 3、创建一个 NSDate 对象，获取未来一个不可到达的时间点
    NSDate *date3 = NSDate.distantFuture;
    NSLog(@"%@", date3);
    // 4、创建一个 NSDate 对象，获取过去一个不可到达的时间点
    date3 = NSDate.distantPast;
    NSLog(@"%@", date3);
    // 5、计算两个时间点的差距 方法：- (double)timeIntervalSinceDate: NSDate 对象;
    double time = [date2 timeIntervalSinceDate:date1];
    NSLog(@"%g", time);
}
// MARK: 提取 NSDate 中的数据（最后转换为字符串）
void getCalendarData() {
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:60 * 60 * 3];
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"YYYY年MM月dd日 HH点mm分ss秒";
    NSString *strDate = [formatter stringFromDate:date];
    NSLog(@"%@, %@", strDate, date);
}
// MARK: 得到 NSDate 中的各个部分数据（并不是字符串类型）
void getInfo() {
    NSDate *date = [NSDate date];
    NSLog(@"%lu年%lu日%lu号", date.year, date.month, date.day);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        demo1();
//        getCalendarData();
        getInfo();
    }
    return 0;
}
