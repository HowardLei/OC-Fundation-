#import <Foundation/Foundation.h>

/*
 枪类：
 类名： Gun
 属性：型号（_gunType）
 行为：射击用到弹夹  弹夹这个对象作为参数
 
 士兵类：
 类名：Person
 属性：姓名   血量  等级
 行为：用各种枪开枪 各种弹夹开枪  --->    参数 弹夹 , 枪

 弹夹
 类名: MyBullet
 属性: 子弹类型  子弹个数
 行为:
 */

//MARK:声明弹夹
@interface Mybullet : NSObject
{
    @public
    NSString * _bulletType;//子弹类型
    int _bulletNumber;//子弹数
}
@end
//MARK:声明枪类
@interface Gun : NSObject
{
@public
    NSString * _GunType;//枪类型
}
-(void)shootwith:(Mybullet *)Mybullet;
@end
//MARK:声明人类
@interface Human : NSObject
{
    @public
    NSString * _name;//人名
    int _blood;//血量
    int _level;//级别
}
-(void)fireByGun:(Gun *)Gun with:(Mybullet *)MyBullet;
@end
//MARK:实现人类
@implementation Human
-(void)fireByGun:(Gun *)Gun with:(Mybullet *)MyBullet{
    NSLog(@"%@对着80米外的敌人，拿着%@冲他扫射。",_name,Gun->_GunType);
    [Gun shootwith:MyBullet];
}
@end
//MARK:实现枪类
@implementation Gun
-(void)shootwith:(Mybullet *)Mybullet{
    if (Mybullet->_bulletNumber >= 1) {
        NSLog(@"拿起手中的%@，开了一枪，还剩%d颗子弹",_GunType,--Mybullet->_bulletNumber);//为啥我不能调用人名？
    } else {
        NSLog(@"都没子了还打");
    }
}
@end
//MARK:实现弹夹
@implementation Mybullet
@end
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //创建一个弹夹
        Mybullet * cjd = [Mybullet new];
        cjd->_bulletType = @"穿甲弹";
        cjd->_bulletNumber = 20;
        //创建一个枪
        Gun * ak = [Gun new];
        ak->_GunType = @"AK47";
        //创建一个人类
        Human * zhangsan = [Human new];
        zhangsan->_name =@"张三丰";
        zhangsan->_blood= 100;
        zhangsan->_level = 110;
        for (int i = 0; i < 7; i++) //在用for句型的时候，记得在i是一个新变量，得在前面声明是int
        {
             [zhangsan fireByGun:ak with:cjd];
        }
    }
    return 0;
}
