//
//  ITProvince.h
//  城市选择
//
//  Created by 雷维卡 on 2019/2/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ITProvince : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSArray<NSString *> *cities;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)provinceWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
