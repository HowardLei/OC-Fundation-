
#import <Foundation/Foundation.h>

@interface Book : NSObject
{
    NSString * _bookName;
    NSString * _author;
}
//MARK:设置书名
-(void)setBookName:(NSString *)bookname;
-(NSString *)Bookname;
//MARK:设置作者
-(void)setBookAuthor:(NSString *)author;
-(NSString *)Author;
@end
