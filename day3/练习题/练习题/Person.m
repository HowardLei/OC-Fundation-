//
//  Person.m
//  练习题
//
//  Created by jyz on 2017/11/17.
//  Copyright © 2017年 jyz. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)getABook:(Book *)book{
    NSLog(@"这是%@的书",_name);
}
-(void)ReadABook:(Book *)book{
    NSLog(@"%d岁的人读着%@",_age,book->_name);
}
@end
