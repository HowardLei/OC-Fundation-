#import "God.h"

@implementation God
-(void)killWithPerson:(Person *)person{
    [person study];
    NSLog(@"上帝把%@杀了", person);
}
@end
