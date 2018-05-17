#import <Foundation/Foundation.h>
#import "Goods.h"
#import "Person.h"
#import "Buyer.h"
#import "Seller.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 创建一个买家
        Buyer *buyer = [[Buyer alloc] init];
        // 创建一个卖家
        Seller *seller =  [[Seller alloc] init];
        // 创建一个商品类
        Goods *goods = [[Goods alloc] init];
        // MARK: 买家信息
        buyer.name = @"王尼玛";
        buyer.age = 18;
        buyer.gender = 1;
        buyer.height = 183.2;
        // MARK: 卖家信息
        seller.name = @"商店";
        seller.age = 18;
        seller.gender = 1;
        seller.height = 175;
        seller.goods = goods;
        // MARK: 货品信息
        goods.price = 99.9;
        goods.weight = 5.1;
        goods.produceDate = (MyDate){2018, 5, 15}; // 这个地方需要进行强转才能实现，因为这里'.'编译器理解为点语法。这个 setter 方法本身只有一个参数。需要将日期转换成结构体才行。
        goods.expireDate = (MyDate){2018, 5, 16};
        [goods release];
        [buyer release];
        [seller release];
    }
    return 0;
}
