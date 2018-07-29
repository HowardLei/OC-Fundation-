#import "Girl.h"

@implementation Girl
- (void)wash {
    NSLog(@"给我洗衣服了");
}
- (void)cook {
    NSLog(@"有人给我做饭吃了");
}
- (void)job {
    NSLog(@"有个好工作，以后给我买外设");
}
- (instancetype)init {
    self = [super init];
    if (self) {
        self.boy = nil;
    }
    return self;
}
@end
