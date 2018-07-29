#import <Foundation/Foundation.h>
#import "MyProtocol.h"
@protocol extraProtocol <MyProtocol>

@required
- (void)add;

@optional
- (void)remove;

@end
