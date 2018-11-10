#import "Listener.h"

@implementation Listener
- (void)messageWithNotification:(NSNotification *)notification {
    NSLog(@"%@", notification);
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
