//
//  Human.h
//  实验文件
//
//  Created by jyz on 2017/11/15.
//  Copyright © 2017年 jyz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gun.h"
@interface Human : NSObject
{
@public
    NSString * _name;
    int  _blood;
    int  _level;
}
-(void)run;
-(void)fireByGun:(Gun *)Gun;
-(void)jump;
-(void)walk;
@end
