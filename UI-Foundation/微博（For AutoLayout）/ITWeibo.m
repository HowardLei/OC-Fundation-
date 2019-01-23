//
//  ITWeibo.m
//  微博（For AutoLayout）
//
//  Created by 雷维卡 on 2019/1/23.
//

#import "ITWeibo.h"

@implementation ITWeibo
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)weiboWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
