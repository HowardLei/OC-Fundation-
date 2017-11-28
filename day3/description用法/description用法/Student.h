
#import <Foundation/Foundation.h>
#import "Book.h"
@interface Student : NSObject
{
    Book * _book;
    NSString * _name;
    int _num;
}
//MARK:设置姓名
-(void)setName:(NSString *)name;
-(NSString *)Name;
//MARK:设置学号
-(void)setNum:(int)num;
-(int)Num;
//创建书
-(void)setBook:(Book *)book;
-(Book *)Book;
@end
