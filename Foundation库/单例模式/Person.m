#import "Person.h"

@implementation Person
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        static id instance = nil;
        if (instance == nil) {
            instance = [super allocWithZone:zone];
        }
        return instance;
    });
}
- (id)copyWithZone:(NSZone *)zone {
    
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
