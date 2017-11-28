//因为有些时候我们不想让一些值被随意修改
#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    int _age;
}
-(void)setAge:(int)age;
-(int)Age;
@end
