//
//  ITGroup.h
//  展示汽车模型（多组版）
//
//  Created by jyz on 2018/9/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ITGroup : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *cars;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)groupWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
