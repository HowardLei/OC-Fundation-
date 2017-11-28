
#import <Foundation/Foundation.h>
#import "Phone.h"
@interface Girl : NSObject
{
    @public
    NSString * _name;
    Phone * _phone;//这已经创建了一个Phone对象，就不用在Phone.h文件上创建Phone名字
}
-(void)makeACallWithPhone:(Phone *)phone;
@end
