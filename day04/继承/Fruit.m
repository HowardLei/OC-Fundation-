#import "Fruit.h"

@implementation Fruit
-(NSString *)description{
    return [NSString stringWithFormat:@"%@", _name];
}
- (double)sellWithPrice:(int)price {
    return self.weight * price;
}
@end
