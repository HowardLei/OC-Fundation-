
#import "Discount.h"

@interface SubDiscount : Discount
@property float rate;//折扣率
- (float)getSubDiscountMoney:(float)money;
@end
