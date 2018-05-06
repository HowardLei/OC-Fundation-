#import <Foundation/Foundation.h>

@interface Car : NSObject
@property double speed;
- (double)compareSpeed:(double)speed1 withSpeed:(double)speed2;
+ (double)compareCarSpeed:(double)speed1 withSpeed:(double)speed2;

@end
