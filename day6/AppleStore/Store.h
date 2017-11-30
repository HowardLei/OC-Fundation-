#import "Shelf.h"
#import "Goods.h"
#import <Foundation/Foundation.h>

@interface Store : NSObject
@property Shelf * shelf;
- (void)helloWorld;//欢迎语
- (float)getRealMoney:(float)money andNum:(int)num;
- (instancetype)init;//重写构造方法，对货架进行初始化
@end
