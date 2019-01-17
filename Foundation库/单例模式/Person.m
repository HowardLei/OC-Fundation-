#import "Person.h"

@implementation Person
// 创建一个私有实例，并且让他为 static 的，赋值为 nil ，这样可以保证创建的实例可以记录有没有被创建。
static id instance = nil;
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (instance == nil) {
            instance = [super allocWithZone:zone];
        }
    });
    return instance;
}

+ (instancetype)defaultPerson {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}
@end
