#import <Foundation/Foundation.h>

@interface Human : NSObject
@property double weight;
// MARK: 比较其他人的体重
- (double)compareWeightWith:(Human *)human;
// MARK: 比较两个人之间的体重
+ (double)compareWeightBetween:(Human *)human1 AndHuman:(Human *)human2;
@end
