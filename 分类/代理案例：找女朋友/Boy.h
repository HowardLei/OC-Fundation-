#import <Foundation/Foundation.h>
#import "GirlFriendProtocol.h"
#import "Girl.h"
@interface Boy : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) int money;
@property (nonatomic, strong) Girl<GirlFriendProtocol> *girl;
- (void)talkLoveWith:(Girl *)girl;
@end
