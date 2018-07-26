#import "NSDate+newProperty.h"

@implementation NSDate (newProperty)
- (NSInteger)year {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar component:NSCalendarUnitYear fromDate:self];
}
- (NSInteger)month {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar component:NSCalendarUnitMonth fromDate:self];
}
- (NSInteger)day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar component:NSCalendarUnitDay fromDate:self];
}
@end
