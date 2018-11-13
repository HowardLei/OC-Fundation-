#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Listener : NSObject
@property (nonatomic, copy) NSString *name;
// 发现通知以后，触发监听事件。注意：这个监听事件可以收集到 NSNotification 对象。所以在参数中可以含 NSNotification 对象。
- (void)messageWithNotification:(NSNotification *)notification;
@end

NS_ASSUME_NONNULL_END
