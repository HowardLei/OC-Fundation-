#import "Person.h"

@implementation Person

/**
 Return an object with customize name.
 @param name 姓名
 @return instancetype
 */
- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.number = @0;
    }
    return self;
}
@end
