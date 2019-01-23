//
//  ITWeibo.h
//  微博（For AutoLayout）
//
//  Created by 雷维卡 on 2019/1/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ITWeibo : NSObject
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong, getter=isVip) NSNumber *vip;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)weiboWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
