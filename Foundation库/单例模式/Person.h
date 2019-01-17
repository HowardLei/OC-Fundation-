#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, assign) int age;
@property (nonatomic, copy) NSString *name;
+ (instancetype)defaultPerson;
@end
