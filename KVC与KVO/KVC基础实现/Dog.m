
//
//  Dog.m
//  KVC基础实现
//
//  Created by jyz on 2018/12/16.
//

#import "Dog.h"

@implementation Dog
- (void)setValue:(id)value forUndefinedKey:(nonnull NSString *)key{
    NSLog(@"对不起，找不到该类对应的属性");
}

@end
