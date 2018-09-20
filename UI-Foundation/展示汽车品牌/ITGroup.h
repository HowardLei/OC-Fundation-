#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ITGroup : NSObject
@property (nonatomic, strong) NSArray *cars;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;

+ (instancetype)groupWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
