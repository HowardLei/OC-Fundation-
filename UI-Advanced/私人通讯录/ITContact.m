//
//  ITContact.m
//  私人通讯录
//
//  Created by apple on 2019/3/8.
//

#import "ITContact.h"

@implementation ITContact
- (instancetype)initWithName:(NSString *)name phoneNumber:(NSString *)phoneNumber {
    self = [super init];
    if (self) {
        _name = name;
        _phoneNumber = phoneNumber;
    }
    return self;
}
- (NSString *)description {
    return [NSString stringWithFormat:@"我是%@，电话：%@", self.name, self.phoneNumber];
}
@end
