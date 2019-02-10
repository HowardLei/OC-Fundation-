//
//  ITCountry.h
//  国旗选择
//
//  Created by 雷维卡 on 2019/2/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ITCountry : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)countryWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
