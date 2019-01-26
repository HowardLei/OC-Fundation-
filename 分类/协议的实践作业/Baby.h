#import <Foundation/Foundation.h>
#import "CareProtocol.h"

@interface Baby : NSObject 
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int age;
@property (nonatomic, strong) id<CareProtocol> person;

- (void)cry;
- (void)eatMilk;
- (void)sleep;
- (void)fellSleepy;
@end
