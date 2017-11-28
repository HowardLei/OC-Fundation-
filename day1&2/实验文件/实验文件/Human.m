//
//  Human.m
//  实验文件
//
//  Created by jyz on 2017/11/15.
//  Copyright © 2017年 jyz. All rights reserved.
//

#import "Human.h"

@implementation Human
-(void)run{
    NSLog(@"%@跑起来",_name);
}
-(void)fireByGun:(Gun *)Gun{
    NSLog(@"%@拿起珍贵的%@,瞄准800里外的鬼子",_name,Gun->_gunType);
    [Gun shoot];
}
-(void)jump{
    NSLog(@"%@跳",_name);
}
-(void)walk{
    NSLog(@"%@慢慢走",_name);
}
@end
