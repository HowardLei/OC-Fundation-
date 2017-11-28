
#import "Student.h"

@implementation Student
//MARK:设置年龄
-(void)setAge:(int)age{
    _age = age;
}
-(int)Age{
    return _age;
}
//MARK:设置名字
-(void)setName:(NSString *)name{
    _name = name;
}
-(NSString *)Name{
    return _name;
}
@end
