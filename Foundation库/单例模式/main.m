#import <Foundation/Foundation.h>
#import "Person.h"
/*
 单例模式
 1、单例模式指的是无论在何时何地创建的对象，创建出来的都是同一个对象
 2、无论如何创建对象，最后都会调用 alloc 方法
    1）alloc 方法的内部，事实上什么都没有做，只是调用了 allocWithZone 方法
    2）实际上申请内存空间 创建对象的都是 allocWithZone 方法在做。
 3、要实现单例模式，就得重写 allocWithZone 方法。
    + (instancetype)allocWithZone:(NSZone *)zone {
        static id instance = nil;// 前面写 static 是保证创建对象的时候检查之前有没有创建这个对象。
        if (instance == nil) {
            instance = [super allocWithZone:zone];
        }
        return instance;
    }
 4、单例模式的规范
    如果这个类是单例模式，要求为这个类提供一个类方法，来返回这个单例对象
    方法名必须以：shared类名; default类名;
 5、单例模式的注意事项：
    如果创建了一个单例对象，则对象里面的数据会共享。所以说修改的时候需要谨慎。
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [Person new];
        Person *p1 = [Person new];
        NSLog(@"%p,%p", p, p1);
        p1.age = 12;
        NSLog(@"%d, %d", p.age, p1.age);
    }
    return 0;
}
