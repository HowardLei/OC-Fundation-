
#import "Soldier.h"

@implementation Soldier
- (instancetype)init
{
    self = [super init];
    if (self) {
        _gun = [[Gun alloc]init];
    }
    return self;
}
- (void)fireByGun:(Gun *)gun{
    NSLog(@"%@拿着手上的%@扫射",_name,gun);
    [gun fire];
}
@end
