#import "Human.h"

@implementation Human 
- (double)compareWeightWith:(Human *)human{
    return [Human compareWeightBetween:self AndHuman:human];
}
+ (double)compareWeightBetween:(Human *)human1 AndHuman:(Human *)human2{
    if (human1.weight < human2.weight) {
        return human2.weight - human1.weight;
    } else {
        return human1.weight - human2.weight;
    }
}
@end
