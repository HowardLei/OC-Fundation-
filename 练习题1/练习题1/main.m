/*
  
  设计一个”狗“类
   1> 属性
   * 颜色
   * 速度（单位是m/s）
   * 性别
   * 体重（单位是kg）
   
   2> 行为
   * 吃：每吃一次，体重增加0.5kg，输出吃完后的体重
   * 吠（叫）：输出所有的属性
   * 跑：每跑一次，体重减少0.5kg，输出速度和跑完后的体重
   * 比较颜色：跟别的狗比较颜色，如果一样，返回YES,否则返回NO
   * 比较速度：跟别的狗比较速度，返回速度差（自己的速度 - 其他狗的速度）
  
  */

#import <Foundation/Foundation.h>

@interface Dog : NSObject
{
    @public
    NSString * _name;
    int _color;
    int _speed;
    int _sex;
    float _weight;
}
-(void)eat;
-(void)bark;
-(void)run;
-(BOOL)CMPcolor:(Dog *)otherDog;
-(int)CMPspeed:(Dog *)otherDog;
@end

@implementation Dog

-(void)eat{
    //吃：每吃一次，体重增加0.5kg，输出吃完后的体重
    _weight += 0.5;
    NSLog(@"%@吃以后现在%.2fkg了",_name,_weight);
}
-(void)bark{
    //输出所有的属性
    NSLog(@"我叫%@,长着一身%d毛,是只%d狗,跑的速度能达到%d迈,重%.2fkg",_name,_color,_sex,_speed,_weight);
}
-(void)run{
    //跑：每跑一次，体重减少0.5kg，输出速度和跑完后的体重
    _weight -= 0.5;
    NSLog(@"现在%@洒了野的跑，他妈以%d迈的速度开始飙车，现在重%.2fkg",_name,_speed,_weight);
}
-(BOOL)CMPcolor:(Dog *)otherDog{
    if (_color == otherDog->_color) {
        return YES;
    } else {
        return NO;
    }
}
-(int)CMPspeed:(Dog *)otherDog{
    return _speed - otherDog->_speed;
}

@end
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//MARK:旺财
        Dog * wangcai = [Dog new];
        wangcai->_name = @"旺财";
        wangcai->_color = 2;
        wangcai->_weight = 120.0f;
        wangcai->_sex = 1;
        wangcai->_speed = 90;
        [wangcai eat];
        [wangcai bark];
//MARK:张三
        Dog * zhangsan = [Dog new];
        zhangsan->_name = @"张三";
        zhangsan->_color = 2;
        zhangsan->_sex = 1;
        zhangsan->_weight = 124.0f;
        zhangsan->_speed = 120;
        [zhangsan bark];
        BOOL flag = [zhangsan CMPcolor:wangcai]; //为啥不是直接调用方法，前面还要加BOOL flag =？
        NSLog(@"他两颜色%d",flag); //这个地方如果颜色相同，输出1，因为这是BOOL型，1为YES。如果颜色不同，则输出为0
        [zhangsan run];
        int rel = [zhangsan CMPspeed:wangcai];
        NSLog(@"rel = %d",rel);
    }
    return 0;
}
