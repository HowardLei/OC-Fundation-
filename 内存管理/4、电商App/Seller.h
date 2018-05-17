#import "Person.h"
#import "Goods.h"
@interface Seller : Person
// 所出售商品 注意：由于 @property 中的参数有 retain 。所以在卖家的 dealloc 方法中，别忘了对 _goods 进行 release 。
@property(nonatomic, retain) Goods *goods;
@end
