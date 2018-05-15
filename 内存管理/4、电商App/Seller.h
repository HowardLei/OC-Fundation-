#import "Person.h"
#import "Goods.h"
@interface Seller : Person
// 所出售商品
@property(nonatomic, retain) Goods *goods;
@end
