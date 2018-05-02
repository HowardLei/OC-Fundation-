#import "Cat.h"

@implementation Cat
-(void)eat{
    NSLog(@"Cat eat method");
}
-(void)run{
    NSLog(@"Cat's unique method");
}
-(NSString *)description{
    return @"猫";
}
@end
