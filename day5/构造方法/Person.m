//
//  Person.m
//  构造方法
//
//  Created by jyz on 2018/11/29.
//

#import "Person.h"

@implementation Person
- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = @"王尼玛";
    }
    return self;
}
- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}
@end
