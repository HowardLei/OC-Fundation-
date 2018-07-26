#import "Gamer.h"

@implementation Gamer

- (void)dealloc{
    NSLog(@"%@先走了", self);
    [self.room release];
    [super dealloc];
}
- (NSString *)description{
    return @"玩家";
}
@end
