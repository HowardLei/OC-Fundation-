//
//  ITGroup.h
//  好友列表
//
//  Created by jyz on 2018/11/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ITGroup : NSObject
@property (nonatomic, strong) NSArray *friends;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *online;
// 设置视图是否可见
@property (nonatomic, assign, getter=isVisible) BOOL visible;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)groupWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
