#import "Seller.h"

@implementation Seller
- (void)dealloc{
    NSLog(@"卖家关门了");
    [_goods release];
    [super dealloc];
}
@end
