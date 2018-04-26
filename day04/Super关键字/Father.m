#import "Father.h"

@implementation Father
// MARK: 父亲的吃的对象方法
- (void)eat{
    NSLog(@"你爸爸我吃完饭了");
    [super eat];
}
- (void)run{
    NSLog(@"跟着你的老爹的节奏跑起来");
}
@end
