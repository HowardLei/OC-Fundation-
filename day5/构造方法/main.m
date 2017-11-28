#import "Dog.h"
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Dog * c = [Dog new];
        Dog * d = [[Dog alloc]init];
        /*
         上边两句等价
         因为：new一下，做了3件事
         1.分配内存空间 + alloc
         2.初始化 - init
         3.返回对象首地址（这件事alloc和init都有在做）
         
         说明
         1.init就是构造方法，是用来初始化对象的方法,注意这是一个对象方法,以减号开头。默认初始化完毕后,所有成员变量的值都为0
         2.alloc方法中做了3件事
            一、向某个类发送alloc消息的结果
            二、为该类分配内存,以存放该类的全部实例变量
            三、还将这块内存区域全部初始化为0
         
         注意
         1.一个刚刚分配的对象并不能立即使用，也就是说不能光进行alloc不进行init。
         2.需要先初始化该对象,然后才能使用它
         3.但由于未进行初始化, 随后可能出现一些不可预测的行为  （这是什么意思？）
         */
    }
    return 0;
}
