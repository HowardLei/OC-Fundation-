
#import "Student.h"

@implementation Student
//设计年龄方法
-(void)setAge:(int)age{
    if (age > 0&&age <100) {
        _age = age;
    } else {
        _age = 20;
    }
}
-(int)Age{
    return _age;
}
//设计姓名方法
-(void)setName:(NSString *)name
{
    if ([name length] > 2) {
        if ([name isEqualToString:@"毛泽东"] || [name isEqualToString:@"习近平"])//比较两个字符串长度，用isequalto方法
        {
            _name = @"佚名";
        } else
        {
            _name = name;
        }
    }else{
        NSLog(@"请重新输入");
    }
}
-(NSString *)Name{
    return _name;
}
//设计英语成绩
-(void)setScore:(int)score{
    if (score > 0&&score < 150) {
        _score = score;
    } else {
        _score = 10;
    }
}
-(int)Score{
    return _score;
}
@end
