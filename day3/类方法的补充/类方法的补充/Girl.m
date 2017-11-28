
#import "Girl.h"

@implementation Girl
+(void)callWithPhone:(Phone *)phone{
    NSLog(@"女孩要打电话了");
    [phone call];//要调用phone,不是Phone，因为这是对象方法，Phone是类名
    /*
     上边的例子可以说明，在类方法中可以调用对象方法
     */
    Girl * g = [Girl new];
    [g eat];//11、12行是用通过在方法中创建对象，然后再调用
}
-(void)eat{
    NSLog(@"吃吃吃......");
}
@end
