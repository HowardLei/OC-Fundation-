//
//  Person.m
//  NSDictionary 类
//
//  Created by apple on 2018/7/22.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}
@end
