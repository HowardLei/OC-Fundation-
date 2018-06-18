#import <Foundation/Foundation.h>
/*
 NSDate 类是负责处理日期类数据
 
 */
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
    
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        demo1();
    }
    return 0;
}
