//
//  Gun.h
//  实验文件
//
//  Created by jyz on 2017/11/15.
//  Copyright © 2017年 jyz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gun : NSObject
{
@public
    NSString * _gunType;
    int  _bulletCount;
}
-(void)shoot;
@end
