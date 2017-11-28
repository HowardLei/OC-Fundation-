#import <Foundation/Foundation.h>

//MARK:声明人类
@interface human : NSObject
{
    @public
    //含有 名字，年龄
    NSString * _name;
    int _age;
}

//方法：有跑，跳，生孩子（生孩子的时候有个名字，是参数）
-(void)run;
-(void)jump;
-(void)GiveBirth:(NSString *)kid;
-(human *)TakeCareOfTheBirthKid;

@end

//MARK:实现人类
@implementation human

-(void)run{
    NSLog(@"%@，快跑",_name);
}
-(void)jump{
    NSLog(@"咋就是跳不起来啊？");
}
-(void)GiveBirth:(NSString *)kid{
    NSLog(@"这是%@家的孩子",_name);
}
-(human *)TakeCareOfTheBirthKid{ //照顾的孩子他的返回值是human *
    human * p = [human new];
    p->_name = @"调皮捣蛋鬼";
    p->_age = 18;
    NSLog(@"%@你他妈到底能不能打印出来？",p->_name);//在调用的时候，不能随便调用对象，只能调用你方法里的对象才行。
    return p;//需要最后返回
}
@end
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        human * zhangsan = [human new];
        zhangsan->_name = @"凤姐";
        zhangsan->_age = 18;
        [zhangsan GiveBirth:@"我"];
        [zhangsan TakeCareOfTheBirthKid];
        human * kid = [human new];
        kid->_name = @"去你大爷";
        NSLog(@"这是谁家的小孩？");
        NSLog(@"这不就是%@家的%@",zhangsan->_name,kid->_name);
    }
    return 0;
}
