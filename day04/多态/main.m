#import <Foundation/Foundation.h>
/*
 多态
 1、概念：同一种行为,对于不同的事物具有不同的表现形式。
 2、满足的条件：有继承关系（保证子类都具能继承到方法）、有方法重写（子类对相同的方法有不同的执行效果）
 3、优点：简化编程接口，容许在类和类之间重用一些习惯性的命名,而不用为每一个新加的函数命名一个新名字。这样,编程接口就是一些抽象的行为的集合,从而实现接口的类的区分开来。
 4、代码体现：用父类类型的指针指向子类对象,这就是多态
 例如：有个 Animal 类，有个 Dog 类继承自 Animal 类，则创建 Dog 对象的时候可以这么写
        Animal * dog = [[Dog alloc] init];
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {

    }
    return 0;
}
