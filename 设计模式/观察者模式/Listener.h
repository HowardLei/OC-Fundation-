#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Listener : NSObject
@property (nonatomic, copy) NSString *name;
- (void)message;
@end

NS_ASSUME_NONNULL_END
