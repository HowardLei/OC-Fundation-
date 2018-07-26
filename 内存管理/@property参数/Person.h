#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCopying>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;
@end
