#import "Car.h"

@implementation Car
- (double)compareSpeed:(double)speed1 withSpeed:(double)speed2{
    if (speed1 < speed2) {
        return speed2 - speed1;
    } else {
        return speed1 - speed2;
    }
}
+ (double)compareCarSpeed:(double)speed1 withSpeed:(double)speed2{
    if (speed1 < speed2) {
        return speed2 - speed1;
    } else {
        return speed1 - speed2;
    }
}

@end
