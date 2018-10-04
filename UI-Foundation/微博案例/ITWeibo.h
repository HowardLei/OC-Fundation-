#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ITWeibo : NSObject
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign, getter=isVip) NSNumber *vip;
@property (nonatomic, copy) NSString *picture;
+ (instancetype)weiboWithDict:(NSDictionary *)dictionary;
- (instancetype)initWithDict:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
