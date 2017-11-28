//
//  Person.h
//  练习题
//
//  Created by jyz on 2017/11/17.
//  Copyright © 2017年 jyz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
@interface Person : NSObject
{
    @public
    NSString * _name;
    Book * _book;
    int _age;
}
-(void)getABook:(Book *)book;
-(void)ReadABook:(Book *)book;
@end
