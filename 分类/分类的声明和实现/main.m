#import <Foundation/Foundation.h>
/*
 分类：Category
 1、作用：
    1）将1个类中的不同方法分到多个不同的文件中存储，便于对类进行模块化设计和团队开发。
    2）可以在不修改原来类的基础上，为这个类扩充一些方法。
    3）注意：
        A 分类中只能增加“方法”，不能增加成员变量。
        B 分类中可以访问原来类中的成员变量。
 2、使用分类的目的
 1）对现有类进行扩展：比如：你可以扩展Cocoa touch框架中的类，你在类别中增加的方法会被子类所继承，而且在运行时跟其他的方法没有区别。
    2）作为子类的替代手段：不需要定义和使用一个子类,你可以通过类别直接向已有的类里增加方法。
    3）对类中的方法归类：利用 category 把一个庞大的类划分为小块来分别进行开发，从而更好的对类中的方法进行更新和维护。
 3、分类方法调用顺序
 当本来和分类具有相同的顺序的时候，优先调用分类的方法。不推荐在分类里重写本类方法。因为：
    1）category没有办法去代替子类，它不能像子类一样通过super去调用父类的方法实现。如果category中重写覆盖了当前类中的某个方法，那么这个当前类中的原始方法实现，将永远不会被执行，这在某些方法里是致命的。(ps:这里提一下，+(void)load 方法是一个特例，它会在当前类执行完之后再在 category 中执行。)
    2）同时，一个 category 也不能可靠的覆盖另一个 category 中相同的类的相同的方法。例如 UIViewController+A 与 UIViewController+B ，都重写了 viewDidLoad ，我们就无法控制谁覆盖了谁。
    3）通过观察头文件我们可以发现，Cocoa 框架中的许多类都是通过c ategory 来实现功能的，可能不经意间你就覆盖了这些方法中的其一，有时候就会产生一些无法排查的异常原因。
    4） category 的诞生只是为了让开发者更加方便的去拓展一个类，它的初衷并不是让你去改变一个类。
 */
#import "Person.h"
#import "Person+eat.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        [p eatFish];
        [p playFootball];
    }
    return 0;
}
