
#import "Student.h"

@implementation Student
- (instancetype)init
{
    self = [super init];
    if (self) {
        _no = 1;
    }
    //如果上边方法只写_no = 1，则年龄无法调用，因为年龄属于父类Person的范畴
    return self;
}
@end
