#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ITCars : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;
+ (instancetype)carsWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
