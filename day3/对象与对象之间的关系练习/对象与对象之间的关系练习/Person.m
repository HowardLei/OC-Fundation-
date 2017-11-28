//
//  Person.m
//  对象与对象之间的关系练习
//
//  Created by jyz on 2017/11/16.
//  Copyright © 2017年 jyz. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)openTheDoorWithKey:(Key *)key{
    NSLog(@"%@用钥匙开门",_name);
    [key openDoor];
}
@end
