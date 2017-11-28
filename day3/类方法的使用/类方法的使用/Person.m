
#import "Person.h"

@implementation Person
-(void)sport{
    NSLog(@"我正在运动---对象方法");
    [Person eat];
}
-(void)eat{
    NSLog(@"我在吃---对象方法");
}
+(void)eat{
    NSLog(@"我就是爱吃---类方法");
}
@end
