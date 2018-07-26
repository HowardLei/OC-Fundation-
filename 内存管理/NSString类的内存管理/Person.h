#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *_name;
}
-(void)setName:(NSString *)name;
-(NSString *)name;
@end
