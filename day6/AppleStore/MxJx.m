
#import "MxJx.h"

@implementation MxJx
- (float)getMxJxMoney:(float)money{
    return money - money / _m * _j;//算打折数值
}
@end
