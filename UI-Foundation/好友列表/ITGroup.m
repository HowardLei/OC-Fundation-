//
//  ITGroup.m
//  好友列表
//
//  Created by jyz on 2018/11/17.
//

#import "ITGroup.h"
#import "ITFriends.h"
@implementation ITGroup
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *friendArr = [NSMutableArray array];
        for (NSDictionary *dict in self.friends) {
            ITFriends *friend = [ITFriends friendsWithDict:dict];
            [friendArr addObject:friend];
        }
        self.friends = friendArr;
    }
    return self;
}
+ (instancetype)groupWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
@end
