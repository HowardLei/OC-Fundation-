#import "Listener.h"

@implementation Listener
- (void)message {
    NSLog(@"发送者发信息了");
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
