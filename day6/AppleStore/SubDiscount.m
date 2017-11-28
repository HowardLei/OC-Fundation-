
#import "SubDiscount.h"

@implementation SubDiscount
- (float)getSubDiscountMoney:(float)money{
    return money * _rate;
}
@end
