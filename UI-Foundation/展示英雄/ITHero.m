#import "ITHero.h"

@implementation ITHero
- (instancetype)initWithDict:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

+ (instancetype)heroWithDict:(NSDictionary *)dictionary {
    return [[self alloc] initWithDict:dictionary];
}
@end
