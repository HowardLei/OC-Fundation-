//
//  ITModel.m
//  通过 xib 实现应用管理（用 CollectionView）
//
//  Created by 雷维卡 on 2019/1/27.
//

#import "ITModel.h"

@implementation ITModel
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
