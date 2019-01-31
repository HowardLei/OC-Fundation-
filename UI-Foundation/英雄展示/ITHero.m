//
//  ITHero.m
//  英雄展示
//
//  Created by 雷维卡 on 2019/1/30.
//

#import "ITHero.h"

@implementation ITHero
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)heroWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
