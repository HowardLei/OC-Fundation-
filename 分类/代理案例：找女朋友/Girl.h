#import <Foundation/Foundation.h>
#import "GirlFriendProtocol.h"
@class Boy;
@interface Girl : NSObject <GirlFriendProtocol>
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) int money;
@property (nonatomic, strong) Boy *boy;
@end
