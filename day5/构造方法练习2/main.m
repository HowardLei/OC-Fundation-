/*
 现在有20个特种兵,特种兵随时随地都拥有一把枪,都可以开火
 类:Soilder
 属性:枪
 行为:开枪
 
 类:Gun
 属性:子弹
 行为:射击
 */
#import <Foundation/Foundation.h>
#import "Soldier.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
     //创建一个士兵
        Soldier * s = [[Soldier alloc]init];
        Soldier * s1 = [[Soldier alloc]init];
        s.name = @"张三丰";
        s1.name = @"本泽马";
        [s fireByGun:s.gun];
        NSLog(@"--------");
        [s1 fireByGun:s1.gun];
    }
    return 0;
}
