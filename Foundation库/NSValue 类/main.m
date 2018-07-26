#import <Foundation/Foundation.h>
/*
 NSValue 类：用于封装各种变量。
 封装方法： valueWithxxx。
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSPoint point1 = NSMakePoint(20, 46);
        NSRange range1 = NSMakeRange(9, 23);
        NSValue *value1 = [NSValue valueWithPoint:point1];
        NSValue *value2 = [NSValue valueWithRange:range1];
        NSArray *arr = @[value1, value2];
        NSLog(@"%@", arr);
    }
    return 0;
}
