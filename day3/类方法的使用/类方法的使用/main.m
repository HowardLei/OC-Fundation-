//人吃东西
#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
      //创建一个人，运动完后就吃东西
        
        //方法1，用2个对象方法进行实现
        Person * zhangsan = [Person new];
        zhangsan->_name = @"张三丰";
        [zhangsan sport];
        [zhangsan eat];
        
        NSLog(@"-------");
        
        //方法2，用一个对象方法加一个类方法实现 实现起来更加快速简单
        Person * lisi = [Person new];
        lisi->_name = @"李四";
        [lisi sport];
    }
    return 0;
}
