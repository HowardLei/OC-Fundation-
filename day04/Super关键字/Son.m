#import "Son.h"

@implementation Son
// MARK: 儿子吃了对象方法
- (void)eat{
    NSLog(@"我吃饭了");
    [super eat];
}
- (void)run{
    NSLog(@"老爹能不能跑慢点");
    [super run];
}
@end
