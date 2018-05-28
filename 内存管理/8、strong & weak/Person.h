#import <Foundation/Foundation.h>
#import "Dog.h"
@interface Person : NSObject
@property (nonatomic, strong) Dog *dog;
@property (nonatomic, assign) int age;
@property (nonatomic, strong) NSString *name;
- (instancetype)initWithName:(NSString *)name;
@end
