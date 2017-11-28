
#import <Foundation/Foundation.h>
#import "Zhongjie.h"
@interface Student : NSObject
{
    NSString * _name;
}
//MARK:创建人
-(void)setName:(NSString *)name;
-(NSString *)Name;
//MARK:找房子
-(void)searchHouseWithZhongjie:(Zhongjie*)zhongjie;
@end
