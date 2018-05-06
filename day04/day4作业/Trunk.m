#import "Trunk.h"

@implementation Trunk
-(NSString *)description{
    return @"大卡车";
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.speed = 120;
    }
    return self;
}
@end
