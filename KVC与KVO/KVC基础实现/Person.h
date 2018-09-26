#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *number;
- (instancetype)initWithName:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
