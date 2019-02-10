//
//  ITCountry.m
//  国旗选择
//
//  Created by 雷维卡 on 2019/2/10.
//

#import "ITCountry.h"

@implementation ITCountry
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)countryWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
