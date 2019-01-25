#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"
/*
 KVC(Key Value Coding) 键值监听。是一个非正式协议。KVC提供了一种间接访问其属性方法或成员变量的机制，可以通过字符串来访问对应的属性方法或成员变量。提供了一个 setter 方法和 getter 方法
 1、setter 方法
    - (void)setValue:(nullable id)value forKey:(NSString *)key;
    这个方法主要对三种类型进行操作：基础数据类型及常量、对象类型、集合类型。
    这个方法每个类都有，并且由KVC提供默认的实现，我们也可以自己重写对应的方法来改变实现。
    在使用KVC时，直接将属性名当做key，并设置value，即可对属性进行赋值。
    注意：这种方法的局限性是只能操作一层对象的属性。如果要操作对象的属性的属性，则需要下边的方法
    - (void)setValue:(nullable id)value forKeyPath:(NSString *)keyPath;
    其中第一个参数仍然为属性对应的值，第二个参数为属性的路径，可以是 xxx.xxx(n 级都可以);
 2、getter 方法
 - (nullable id)valueForKey:(NSString *)key;
    返回这个 key 对应的属性的值（只能找一级属性）
 - (nullable id)valueForKeyPath:(NSString *)keyPath;
    返回这个 key 对应的属性的值（能找到任何一级属性）
 在实践当中，用到 valueForKeyPath 方法更加多。因为他更加灵活，在调用的时候会先调用 valueForKey 方法。如果这个方法没有查到属性，则再会调用 valueForKeyPath 进行查找，如果还没有查找到值，则会调用 valueForUndefinedKey: 方法，并且抛出异常。
 注意：如果想检查 key 中的属性是否都写对了，可以利用反射原理，用 NSStringFromxxx 的函数来检查。
 */
// 基础 Getter 搜索模式
/*
 1、这是 valueForKey: 的默认实现，给定一个 key 当做输入参数，开始下面的步骤，在这个接收 valueForKey: 方法调用的类内部进行操作。
 2、通过 getter 方法搜索实例，例如get, is, _的拼接方案。按照这个顺序，如果发现符合的方法，就调用对应的方法并拿着结果跳转到第五步。否则，就继续到下一步。如果没有找到简单的getter方法，则搜索其匹配模式的方法 countOf 、objectInAtIndex:、AtIndexes:。如果找到其中的第一个和其他两个中的一个，则创建一个集合代理对象，该对象响应所有 NSArray 的方法并返回该对象。否则，继续到第三步。代理对象随后将 NSArray 接收到的 countOf 、objectInAtIndex:、AtIndexes: 的消息给符合 KVC 规则的调用方。当代理对象和KVC调用方通过上面方法一起工作时，就会允许其行为类似于 NSArray 一样。
 3、如果没有找到NSArray简单存取方法，或者 NSArray 存取方法组。则查找有没有 countOf、enumeratorOf、memberOf:命名的方法。如果找到三个方法，则创建一个集合代理对象，该对象响应所有NSSet方法并返回。否则，继续执行第四步。此代理对象随后转换 countOf、enumeratorOf、memberOf:方法调用到创建它的对象上。实际上，这个代理对象和NSSet一起工作，使得其表象上看起来是 NSSet。
 4、如果没有发现简单 getter 方法，或集合存取方法组，以及接收类方法 accessInstanceVariablesDirectly 是返回 YES 的。搜索一个名为 _、 _is、is的实例，根据他们的顺序。如果发现对应的实例，则立刻获得实例可用的值并跳转到第五步，否则，跳转到第六步。
 5、如果取回的是一个对象指针，则直接返回这个结果。
    如果取回的是一个基础数据类型，但是这个基础数据类型是被NSNumber支持的，则存储为 NSNumber 并返回。
    如果取回的是一个不支持 NSNumber 的基础数据类型，则通过 NSValue 进行存储并返回。
 6、如果所有情况都失败，则调用 valueForUndefinedKey: 方法并抛出异常，这是默认行为。但是子类可以重写此方法。
 */
// 基础 Setter 搜索模式
/*
 这是 setValue:forKey: 的默认实现，给定输入参数 value 和 key 。试图在接收调用对象的内部，设置属性名为 key 的 value ，通过下面的步骤：
 1、查找 set: 或 _set 命名的 setter ，按照这个顺序，如果找到的话，调用这个方法并将值传进去(根据需要进行对象转换)。
 2、如果没有发现一个简单的 setter，但是 accessInstanceVariablesDirectly 类属性返回 YES ，则查找一个命名规则为_、_is、、is的实例变量。根据这个顺序，如果发现则将 value 赋值给实例变量。
 3、如果没有发现 setter 或实例变量，则调用 setValue:forUndefinedKey: 方法，并默认提出一个异常，但是一个 NSObject 的子类可以提出合适的行为。
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p1 = [[Person alloc] init];
        p1.name = @"王尼玛";
        NSLog(@"%@", [p1 valueForKey:@"name"]);
        Dog *dog = [[Dog alloc] init];
        @try {
            [dog setValue:@213 forKeyPath:@"dog.age"];
        } @catch (NSException *exception) {
            NSLog(@"对不起，找不到对应属性");
        }
        p1.dog = dog;
        [p1 setValue:@"王尼玛" forKeyPath:@"dog.name"];
        NSLog(@"%@", p1.dog.name);
    }
    return 0;

}
