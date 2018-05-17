#import "Person.h"

@implementation Person
- (void)dealloc{
    NSLog(@"人没了");
    [_cat release];
    [super dealloc];
}
@end
