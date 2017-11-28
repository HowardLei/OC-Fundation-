
#import "Student.h"

@implementation Student
//MARK:设置姓名
-(void)setName:(NSString *)name{
    _name = name;
    NSLog(@"我是%@",_name);
}
-(NSString *)Name{
    return _name;
}
//MARK:设置学号
-(void)setNum:(int)num{
    _num = num;
    NSLog(@"我的学号是%d",_num);
}
-(int)Num{
    return _num;
}
//创建书
-(void)setBook:(Book *)book;{
    _book = book;
}
-(Book *)Book{
    return _book;
}
@end
