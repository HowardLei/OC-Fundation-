#import <Foundation/Foundation.h>
@class Dog;
NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *number;
@property (nonatomic, strong, getter=hasDog) Dog *dog;
- (instancetype)initWithName:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
