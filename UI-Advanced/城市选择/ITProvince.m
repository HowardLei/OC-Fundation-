//
//  ITProvince.m
//  城市选择
//
//  Created by 雷维卡 on 2019/2/9.
//

#import "ITProvince.h"

@implementation ITProvince
+ (instancetype)provinceWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
