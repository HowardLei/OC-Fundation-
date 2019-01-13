//
//  ITChat.m
//  QQ聊天
//
//  Created by jyz on 2018/10/15.
//

#import "ITChat.h"

@implementation ITChat
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)chatWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
- (instancetype)initWithType:(ITChatPerson)type {
    self = [super init];
    if (self) {
        self.type = type;
    }
    return self;
}
@end
