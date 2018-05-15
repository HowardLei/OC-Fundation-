#import <Foundation/Foundation.h>
#import "Goods.h"
#import "Person.h"
#import "Buyer.h"
#import "Seller.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 创建一个买家
        Person *buyer = [[Buyer alloc] init];
        // 创建一个卖家
        Person *seller =  [[Seller alloc] init];
        // 创建一个商品类
        Goods *goods = [[Goods alloc] init];
        // MARK: 买家信息
        buyer.name = @"王尼玛";
        buyer.age = 18;
        buyer.gender = 1;
        buyer.height = 183.2;
        // MARK: 卖家信息
        seller.name = @"世界";
        seller.age = 18;
        seller.gender = 1;
        seller.height = 175;
        id i = seller;
        [i setGoods:goods];
        // MARK: 货品信息
        goods.price = 99.9;
        goods.weight = 5.1;
        
    }
    return 0;
}
