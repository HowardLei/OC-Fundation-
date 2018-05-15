#import <Foundation/Foundation.h>

@interface Goods : NSObject
typedef struct{
    int year;
    int month;
    int day;
}MyDate;
// 单价
@property(nonatomic, assign) double price;
// 重量
@property(nonatomic, assign) double weight;
// 图片
@property(nonatomic, assign) FILE *picture;
// 生产日期
@property(nonatomic, assign) MyDate produceDate;
// 过期日期
@property(nonatomic, assign) MyDate expireDate;
@end
