#import "ITCars.h"

@implementation ITCars
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)carsWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
