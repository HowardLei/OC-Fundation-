#import <Foundation/Foundation.h>
/*
 枪类：
 类名: Gun
 属性：型号(_gunType)，子弹个数(_bulletCount)
 行为： 射击
 */

//MARK:声明枪类
@interface Gun : NSObject
{
    @public
    NSString * _gunType;
    int  _bulletCount;
}
-(void)shoot;

@end
//MARK:实现枪类
@implementation Gun

-(void)shoot{
    if (_bulletCount >=1) {
         NSLog(@"%@开火了，还剩%d发子弹",_gunType,--_bulletCount);//'--'这是自减运算
    } else {
        NSLog(@"都没子了还开火");
    }
}
@end

/*
 人类
 名称：Person
 属性：姓名(_name)  血量(_red)  等级(_level)
 行为： 跑 开枪(用枪开枪)  跳  走
 */

//MARK:声明人类
@interface human : NSObject
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

//MARK:实现人类
@implementation human

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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //创建一把枪
        Gun * ak = [Gun new];
        ak->_gunType = @"AK47";
        ak->_bulletCount = 30;
        [ak shoot];
        //创建一个人
        human * zhangsan = [human new];
        zhangsan->_name = @"张三丰";
        zhangsan->_blood = 100;
        zhangsan->_level = 100;
        
        for (int i = 0 ; i < 8; i++) {
            NSLog(@"---------");
            [zhangsan fireByGun:ak];
        }
    return 0;
    }
}
