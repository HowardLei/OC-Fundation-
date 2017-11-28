
#import <Foundation/Foundation.h>
#import "Key.h"
@interface Person : NSObject
{
    @public
    Key * _key;
    NSString *_name;
}
-(void)openTheDoorWithKey:(Key *)key;
@end
