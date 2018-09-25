#import "ITGroup.h"
#import "ITCars.h"
@implementation ITGroup
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
        // 创建一个用来保存模型的数组
        NSMutableArray *modelsArr = [NSMutableArray array];
        // 遍历字典当中的数组，转化成模型。将模型保存到数组当中
        for (NSDictionary *data in dict[@"cars"]) {
            ITCars *model = [ITCars carsWithDict:data];
            [modelsArr addObject:model];
        }
        self.cars = modelsArr;
    }
    return self;
}
+ (instancetype)groupWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
