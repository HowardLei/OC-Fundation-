//
//  Girl.h
//  综合案例
//
//  Created by jyz on 2017/11/17.
//  Copyright © 2017年 jyz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cat.h"
struct birthday {
    int y;
    int m;
    int d;
};
@interface Girl : NSObject
{
    @public
    NSString * _name;
    int _sex;
    struct birthday _birthday;
    Cat * _miao;
}
-(void)feedTheCat:(Cat *)cat;
-(void)playWithTheCat:(Cat *)cat;
@end
