#import <Foundation/Foundation.h>
#import "Factory.h"
#import "Factory+ProduceGoods.h"
#import "Factory+PackageGoods.h"
#import "Factory+CalcGoodsPrice.h"
#import "Factory+SellGoods.h"
/*
 需求：创建一个工厂
    扩展一个加工分类：加工商品
    扩展一个包装分类：包装商品
    扩展一个销售分类：销售商品
    扩展一个财务分类：计算价格
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Factory *f = [[Factory alloc] init];
        // 调用扩展类的方法
        [f produceGoods];
        [f packageGoods];
        [f sellGoods];
        [f calcGoodsPrice];
    }
    return 0;
}
