
#import "Book.h"

@implementation Book
- (NSString *)description
{
    return [NSString stringWithFormat:@"%@",_bookName];
}//如果把——bookName换成self，会造成死循环
//MARK:设置书名
-(void)setBookName:(NSString *)bookname{
    _bookName = bookname;
}
-(NSString *)Bookname{
    return _bookName;
}
//MARK:设置作者
-(void)setBookAuthor:(NSString *)author{
    _author = author;
}
-(NSString *)Author{
    return _author;
}
@end
