/*
 创建一个人，吃东西就增加0.6，每走100步减少0.2，不足100步不减。

 */

#import <Foundation/Foundation.h>


#pragma mark 声明人类
//先声明一个人类  属性有名字，体重  行为有吃和走 其中走还含参数
@interface human : NSObject
{
    @public
    NSString * _name;
    float _weight;
}
- (void)eat;
- (void)walk:(int)steps;

@end

//MARK:实现人类
#pragma mark 实现人类
//上面2个是等价的，均是标注代码的

@implementation human

- (void)eat{
    _weight += 0.6;//每当他吃东西的时候，体重就增加0.6
    NSLog(@"%@的体重吃完后增加到%.2f",_name,_weight);
}
- (void)walk:(int)steps{
    if (steps >= 100) {
        _weight = _weight - steps/100 * 0.2;
        NSLog(@"%@经过运动后体重变为%.2f",_name,_weight);}
}
@end
#pragma mark - 用于上面分类的
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        human * zhangsan = [human new];
        zhangsan->_name = @"张三丰";
        zhangsan->_weight = 100.0f;
        [zhangsan eat];
        [zhangsan walk:300];
    }
    return 0;
}

/*
void test(){
    printf("我就是比你66666 \n");
}
    上面这段函数中，可以放在任何一个地方，除了@interface 与 @end之间
    如果放在main函数后边，则需要在main函数中先声明，再读取。
 关于函数和对象方法的区别
 1.所有的函数都是平行关系，不能嵌套
 2.函数不存在隶属关系
 3.使用的时候可以直接调用
 4.不可以访问对象中的成员变量
*/
