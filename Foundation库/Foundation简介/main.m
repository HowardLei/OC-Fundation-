#import <Foundation/Foundation.h>
//#import <Foundation/NSString.h>
//#import <Foundation/NSObjCRuntime.h>
/*
 1、什么是框架/库
    框架/库指已经编写好的类库，方法等集合
 2、什么是 Foundation 框架？
    Foundation 框架就是 Apple 为了帮助开发者在 macOS，iOS，watchOS，tvOS 开发 App所提供的类，方法，常量等数据信息。
 3、Foundation 框架下的内容
    NSString/NSMutableString
    NSArray/NSMutableArray || NSDictionary/NSMutableDictionary
    NSValue/NSNumber (包装数值类)
    NSDate/NSDateFormatter/NSDateComponents/NSCalendar (日期类)
    NSURL (网络通信类)
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str = @"王尼玛";
        NSMutableString *varStr = [NSMutableString stringWithString:str];
        for (int i = 0; i < str.length; i++) {
            [varStr appendFormat:@"%d", i];
        }
        NSLog(@"%@", varStr);
        NSLog(@"%ld", [str length]);
    }
    return 0;
}
