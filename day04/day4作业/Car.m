#import "Car.h"

@implementation Car
- (double)compareSpeedWithOtherCar:(Car *)car{
    return [Car compareCar:self WithCar:car];
}
+ (double)compareCar:(Car *)car1 WithCar:(Car *)car2{
    if (car1.speed < car2.speed) {
        return car2.speed - car1.speed;
    } else {
        return car1.speed - car2.speed;
    }
}
@end
