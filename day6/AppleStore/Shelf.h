
#import <Foundation/Foundation.h>

@interface Shelf : NSObject
@property NSMutableArray * phoneArray;//创建一个手机货架
@property NSMutableArray * padArray;//创建一个平板货架
@property NSMutableArray * macArray;//创建一个Mac货架
- (void)addGoodsWithName:(NSString *)name andCount:(int)count;//往货架上边添加商品
- (NSMutableArray *)getGoodsWithName:(NSString *)name andCount:(int)count;//从货架上边取商品
- (void)show;//展示库存
- (instancetype)init;//给手机、平板、Mac货架初始化
@end
