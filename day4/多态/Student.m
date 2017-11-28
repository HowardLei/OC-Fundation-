
#import "Student.h"

@implementation Student
//MARK:创建人
-(void)setName:(NSString *)name{
    _name = name;
}
-(NSString *)Name{
    return _name;
}
//MARK:找房子
-(void)searchHouseWithZhongjie:(Zhongjie*)zhongjie{
    NSLog(@"%@已经帮我找到房子了",zhongjie);
}
@end
