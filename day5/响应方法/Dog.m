
#import "Dog.h"

@implementation Dog
-(void)run{
    NSLog(@"跑起来");
}
-(void)setName:(NSString *)name{
    NSLog(@"我叫%@",name);
}
@end
