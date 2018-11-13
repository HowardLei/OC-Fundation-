#import "Listener.h"

@implementation Listener
- (void)messageWithNotification:(NSNotification *)notification {
    NSLog(@"name = %@", notification.name);
    // 由于notification 中的 userInfo 是字典，所以需要遍历字典来进行正常输出
    for (NSString *key in notification.userInfo) {
        NSLog(@"%@:%@", key, notification.userInfo[key]);
    }
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
