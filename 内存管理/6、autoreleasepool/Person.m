#import "Person.h"

@implementation Person
- (void)dealloc
{
    NSLog(@"人没了");
    [super dealloc];
}

@end
