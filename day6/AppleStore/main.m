/*
 创建一个AppleStore
 有以下类
 1.类:AppleStore
    属性:货架
    方法:欢迎语
 2.类:货架类
    属性:手机货架、电脑货架、平板货架
    方法:取商品
 3.类:商品父类
    属性:价格、名称
 4.子类:iPhone、iPad、Mac系列
 5.类:打折父类
    方法:根据原价计算打折后的价格---不打折
 6.类:子类:打几折、每满300减50
 */
#import <Foundation/Foundation.h>
#import "Store.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //需求：只要创建一个Store，所有的东西就都初始化成功了
        Store * store = [[Store alloc]init];
        [store helloWorld];
    }
    return 0;
}
//Mac无法够买，买的话就直接崩掉
