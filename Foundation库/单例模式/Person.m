#import "Person.h"

@implementation Person
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static id instance = nil;
    if (instance == nil) {
        instance = [super allocWithZone:zone];
    }
    return instance;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        _age = 18;
        _name = @"王尼玛";
    }
    return self;
}
@end
