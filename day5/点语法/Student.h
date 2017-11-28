
#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    int _age;
    NSString * _name;
}
//MARK:设置年龄
-(void)setAge:(int)age;
-(int)Age;
//MARK:设置名字
-(void)setName:(NSString *)name;
-(NSString *)Name;
@end
