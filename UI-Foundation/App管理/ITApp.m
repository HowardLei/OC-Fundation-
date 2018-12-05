//
//  ITApp.m
//  App管理
//
//  Created by jyz on 2018/12/5.
//

#import "ITApp.h"

@implementation ITApp
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)appWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
