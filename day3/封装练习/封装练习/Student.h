
#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    int _age;
    NSString * _name;
    int _score;
}
//设计年龄方法
-(void)setAge:(int)age;
-(int)Age;
//设计姓名方法
-(void)setName:(NSString *)name;
-(NSString *)Name;
//设计英语成绩
-(void)setScore:(int)score;
-(int)Score;
@end
