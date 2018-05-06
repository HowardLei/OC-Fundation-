#import <Foundation/Foundation.h>
#import "Student.h"
#import "Person.h"
/*
 SEL:
 1、作用：
    1)包装方法
    2)可以用来作为方法的形参
    3)可以用来作为方法的实参
 2、本质：typedef struct objc_selector *SEL; 结构体指针
 3、用法
 1)创建：SEL 名称 = @selector(方法);
 2)调用：[对象 performSelector:SEL类型的数据];
 4、原理
 1)首先把方法名包装成SEL类型的数据;
 2)根据SEL数据找到对应的方法地址;
 3)根据方法地址调用相应的方法。
 4)注意:在这个操作过程中有缓存,第一次找的时候是一个一个的找,非常耗性能,之后再用到的时候就直接使用。
 5、应用
 判断某个类是否具有这个方法。
 + (BOOL)instancesRespondToSelector:(SEL)aSelector;
 6、总结
 SEL其实是对方法的一种包装,将方法包装成一个SEL类型的数据,去寻找对应的方法地址,找到方法地址后就可以调用方法。这些都是运行时特性,发消息就是发送SEL,然后根据SEL找到地址,调用方法。
 这也就是为啥在运用多态的时候，父类指针指向子类对象，调用子类方法可以用SEL来进行调用的原因。因为这是运行时的特征。
 */
// MARK: 一般执行的方法的方式
void common(){
    Person *s = [[Student alloc] init];
    Person *t = [[Student alloc] init];
    [s studyWithPerson:t];
}
// MARK: 用 SEL 包装方法
void sel(){
    Person *zhangsan = [[Student alloc] init];
    SEL s1 = @selector(play);
    [zhangsan performSelector:s1];// FIXME: 出现爆栈警告，如果忽视可能会造成内存泄露
    BOOL a = [Person instancesRespondToSelector:s1];
    BOOL b = [Student instancesRespondToSelector:s1];
    NSLog(@"%d, %d", a, b);
}
// MARK: 调用静态 selector 为什么不会出现错误？
// Answer: 这种情况下编译器就能在编译阶段得到关于这个 selector 的全部信息，不需要默认任何事情。
// 可是为啥调用 SEL 包装的方法就报警告，难道他获得的不是 selector 中的全部信息？
void rightCode(){
    Person *zhangsan = [[Student alloc] init];
    Person *wangnima = [[Student alloc] init];
    [zhangsan performSelector:@selector(play)];
    [zhangsan performSelector:@selector(studyWithPerson:) withObject:wangnima];
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        common();
        sel();
    }
    return 0;
}
