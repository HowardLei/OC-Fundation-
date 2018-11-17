//
//  ITFriends.h
//  好友列表
//
//  Created by jyz on 2018/11/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ITFriends : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *vip;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)friendsWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
