#import "ITGoods.h"

@implementation ITGoods
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)goodsWithDict:(NSDictionary *)dict {
    return  [[self alloc] initWithDict:dict];
}
@end
