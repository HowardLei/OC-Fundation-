#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ITHero : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *intro;
+ (instancetype)heroWithDict:(NSDictionary *)dictionary;
- (instancetype)initWithDict:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
