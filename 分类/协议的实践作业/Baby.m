#import "Baby.h"

@implementation Baby
- (void)cry {
    NSLog(@"哭哭哭");
    [_person feedMilk];
    [self eatMilk];
}
- (void)eatMilk {
    NSLog(@"吃奶奶");
}
- (void)fellSleepy {
    NSLog(@"有点小困");
    [_person sleep];
    [self sleep];
}
- (void)sleep {
    NSLog(@"Orzzzzz");
}
@end
