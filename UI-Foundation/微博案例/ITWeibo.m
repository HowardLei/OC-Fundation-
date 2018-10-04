#import "ITWeibo.h"

@implementation ITWeibo
- (instancetype)initWithDict:(NSDictionary *)dictionary {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}
+ (instancetype)weiboWithDict:(NSDictionary *)dictionary {
    return [[self alloc] initWithDict:dictionary];
}
@end