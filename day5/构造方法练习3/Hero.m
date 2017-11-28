
#import "Hero.h"

@implementation Hero
- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}
@end
