/*
 类名:女孩 
 属性:姓名(NSString)、生日(结构体)、性别(BOOL),猫
 方法:喂猫、跟猫 起玩
 类名:猫
 属性:体重、毛色(hairColor)(枚举) 
 方法:跳，吃
 */
#import <Foundation/Foundation.h>
#import "Girl.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Girl * xiaohong = [Girl new];
        xiaohong->_name = @"小红";
        xiaohong->_sex = 0;
        struct birthday mydate = {1999,02,24};
        xiaohong->_birthday = mydate;
        NSLog(@"name = %@ 出生于%d年%d月%d日",xiaohong->_name,xiaohong->_birthday.y,xiaohong->_birthday.m,xiaohong->_birthday.d);
        Cat * Mi = [Cat new];
        Mi->_catName = @"小可爱";
        xiaohong->_miao = Mi;
        [xiaohong feedTheCat:Mi];//喂猫
        [xiaohong playWithTheCat:Mi];//跟猫一起玩
        
    }
    return 0;
}
