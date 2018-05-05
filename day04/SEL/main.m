#import <Foundation/Foundation.h>
#import "Student.h"
#import "Person.h"
/*
 SEL:
 1、作用：包装方法
 2、本质：typedef struct objc_selector *SEL; 结构体指针
 3、用法
 1)创建：SEL 名称 = @selector(方法);
 2)调用：[对象 performSelector:SEL类型的数据];
 4、应用
 判断某个类是否具有这个方法。
 + (BOOL)instancesRespondToSelector:(SEL)aSelector;
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
