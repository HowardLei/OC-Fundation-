#import "Cat.h"

@implementation Cat
- (void)dealloc{
    NSLog(@"猫也走了");
    [super dealloc];
}
@end
