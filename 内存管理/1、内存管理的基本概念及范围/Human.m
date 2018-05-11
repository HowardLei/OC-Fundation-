#import "Human.h"

@implementation Human
- (void)dealloc{
    NSLog(@"人对象没所有者了……被回收了");
    [super dealloc];
}
@end
