#import <Foundation/Foundation.h>
#import "Person.h"
#import "Fruit.h"
/*
 继承
 1、定义：让某个类型的对象获得另一个类型的对象的属性的方法。
 2、 OC 中继承的特殊点：每个子类只继承一个父类（注意：每个 OC 对象只有一个直接父类，但是可以拥有很多间接父类）
 3、子类可以调用父类的方法，用 super 或者是 self 都可以
 4、注意：在父类的 .m 文件中创建的成员变量是私有的，子类只能继承，不能使用
 5、不要为了继承而继承（一定要在逻辑上满足条件才行）
 6、在继承的时候，调用方法时，先看本类的方法，如果没有，则看父类的，直到 NSObject 。如果 NSObject 也没有，则会报错。
 7、如果父类方法不能满足子类需求的时候，子类可以重写方法。
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc]init];
        p.name = @"王尼玛";
        Apple *a = [[Apple alloc]init];
        a.name = @"苹果";
        [p eatFruit:a];
    }
    return 0;
}
