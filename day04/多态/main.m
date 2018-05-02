#import <Foundation/Foundation.h>
#import "Person.h"
#import "Animal.h"
#import "Dog.h"
#import "Cat.h"
void demo1(){
    /*
     多态
     1、概念：同一种行为,对于不同的事物具有不同的表现形式。
     2、满足的条件：有继承关系（保证子类都具能继承到方法）、有方法重写（子类对相同的方法有不同的执行效果）
     3、优点：简化编程接口，容许在类和类之间重用一些习惯性的命名,而不用为每一个新加的函数命名一个新名字。这样,编程接口就是一些抽象的行为的集合,从而实现接口的类的区分开来。
     4、代码体现：用父类类型的指针指向子类对象,这就是多态
     例如：有个 Animal 类，有个 Dog 类继承自 Animal 类，则创建 Dog 对象的时候可以这么写
     Animal * dog = [[Dog alloc] init];
     */
}
void demo2(){
    /*
     多态的实现：即父类类型的指针指向子类对象
     实现原理：由于在 OC 中，指针类型的变量有两个：一个是编译时类型，一个是运行时类型。当两者不相同的时候，则出现多态
     1、编译时类型：编译器在编译时，只检查指针变量的类型，确定该指针变量类型里面有下面调用的方法，如果有该方法，编译器就认为正确，可以编译通过。
     2、运行时类型：会动态监测对象的真实类型。然后，调用对象自己的方法。
     所以，父类可以访问子类继承自父类的方法,但是无法访问子类独有的方法。
     因为子类独有的方法编译器不通过。
     但是，并不是编译器通过的方法就是合法的方法！！！可能在运行时不存在。
     如何解决父类无法访问子类独有的方法
     1、用 id 类型。因为 id 类型是万能指针，可以指向任何 OC 对象。编译器不对 id 做类型检测。
     2、指针变量强转
    */
}
// MARK: 正确的代码
void rightCode(){
    // 创建一个 cat 对象。注意：在编译时，这个指针类型属于 Animal 类。在运行时，它属于 Cat 类
    Animal *cat = [[Cat alloc] init];
    // 创建一个 dog 对象。注意：在编译时，这个指针类型属于 Animal 类。在运行时，它属于 Dog 类
    Animal *dog = [[Dog alloc] init];
    // 创建一个人对象
    Person *p = [[Person alloc] init];
    // 狗吃的方法。 注意：在编译的时候，由于他属于 Animal 类，所以在调用方法时编译器检查 Animal 类有没有此方法，如果有就通过，没有就不行。但是在运行时是调用的是 Dog 类的方法。
    [dog eat];
    [cat eat];
    id cat1 = cat;
    [cat1 run];
    [p toGetAnAnimal:dog];
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        rightCode();
    }
    return 0;
}
