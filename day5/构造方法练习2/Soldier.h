#import "Gun.h"
#import <Foundation/Foundation.h>

@interface Soldier : NSObject
@property NSString *name;
@property Gun * gun;
- (instancetype)init;
- (void)fireByGun:(Gun *)gun;
@end
