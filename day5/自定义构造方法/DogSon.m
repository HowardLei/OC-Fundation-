
#import "DogSon.h"

@implementation DogSon
- (instancetype)initWithName:(NSString *)name andAge:(int)age
{
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
    }
    return self;
}
- (instancetype)init
{
    if (self = [super init]) {
        NSLog(@"DogSon---%@",self);//这里面的self是DogSon
    }
    return self;
}
@end
