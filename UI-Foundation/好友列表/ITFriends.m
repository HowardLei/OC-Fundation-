//
//  ITFriends.m
//  好友列表
//
//  Created by jyz on 2018/11/17.
//

#import "ITFriends.h"

@implementation ITFriends
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)friendsWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
