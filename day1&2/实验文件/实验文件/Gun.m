//
//  Gun.m
//  实验文件
//
//  Created by jyz on 2017/11/15.
//  Copyright © 2017年 jyz. All rights reserved.
//

#import "Gun.h"

@implementation Gun
-(void)shoot{
    if (_bulletCount >=1) {
        NSLog(@"%@开火了，还剩%d发子弹",_gunType,--_bulletCount);//'--'这是自减运算
    } else {
        NSLog(@"都没子了还开火");
    }
}
@end
