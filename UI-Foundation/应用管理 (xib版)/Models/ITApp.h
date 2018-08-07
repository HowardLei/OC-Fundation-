#import <Foundation/Foundation.h>
/*
 字典转模型
 1、在开发的过程中，如果在调用字典中的数据的时候，对字典的键名检查完全靠自己，如果打错了，检查出来成本很高（编译时不报错：因为里面的数据是字符串，而在运行时编译器运行的时候没有找到对应的键而崩）。所以说将里面的键转化成对象的属性，而值转换成对象属性的值，将原先数组需要保存的数据类型从字典到对象，更加简单方便。而且可以方便的使用面向对象的特性对里面的内容进行扩展。
 2、什么是模型？
 模型就是自定义的类，通过为类添加各种属性来保存数据
 3、字典转模型需要做什么？
 1）创建一个模型类
 2）在懒加载数据的时候，把加载的数据都放在模型对象中，然后将模型对象中的数据放回数组中。
 4、模型需要些什么？
 1）提供字典中的键所对应的属性
 2）提供一个初始化的类方法和对象方法
 */
@interface ITApp : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)appWithDict:(NSDictionary *)dict;

@end
