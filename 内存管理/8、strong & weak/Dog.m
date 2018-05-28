#import "Dog.h"

@implementation Dog
- (NSString *)description {
    return @"旺财";
}
- (void)dealloc {
    NSLog(@"狗也走了");
}
@end
