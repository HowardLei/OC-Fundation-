#import <Foundation/Foundation.h>
#import "Dog.h"
#import "DogSon.h"
/**
 1).判断对象是不是指定类的对象或者指定类的子类对象.
 - (BOOL)isKindOfClass:(Class)aClass;
 
 2).判断对象是不是1个特定类型的对象,不包括子类.
 - (BOOL)isMemberOfClass:(Class)aClass;
 
 3).判断1个类是不是另外1个类的子类.
 + (BOOL)isSubclassOfClass:(Class)aClass;
 
 4).判断对象中是否能响应指定的方法. 这个最常用.
 - (BOOL)respondsToSelector:(SEL)aSelector;
 
 5).判断类中是否能响应指定方法.
 +(BOOL)instancesRespondToSelector:(SEL)aSelector;
 
 */
void demo1()//1.判断对象是不是指定类的对象或者指定类的子类对象
//- (BOOL)isKindOfClass:(Class)aClass;
{
    DogSon * son = [DogSon new];
    Class dog = [Dog class];//获取狗的类对象，用于下边比较时候进行引用
    BOOL res = [son isKindOfClass:dog];//检查son对象是否为小狗类创建出来的对象
    NSLog(@"%d",res);
}

void demo2()//2.判断对象是不是1个特定类型的对象,不包括父类及子类
{
    DogSon * son = [DogSon new];
    Class dog = [Dog class];//获取狗的类对象
    BOOL res = [son isMemberOfClass:dog];
    NSLog(@"%d",res);
}
void demo3()//3.判断某个对象能否响应某个方法
{
    Dog * son = [Dog new];
    SEL s = @selector(play);
    BOOL res = [son respondsToSelector:s];//判断play方法能不能在Dog类找到对应方法实行方法
    NSLog(@"%d",res);//结果是0，因为play这个方法是建立在DogSon类，并非Dog类
}
void demo4()//判断一个类是不是另外1个类的子类.
{
    Class c = [Dog class];
    BOOL res = [DogSon isSubclassOfClass:c];
    NSLog(@"%d",res);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        demo1();
        demo2();
        demo3();
        demo4();
    }
    return 0;
}
