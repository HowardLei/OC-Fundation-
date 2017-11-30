
#import "Shelf.h"
#import "iPad.h"
#import "iPhone.h"
#import "Mac.h"
@implementation Shelf
NSString * iPhoneName = @"iPhone";
NSString * iPadName = @"iPad";
NSString * MacName = @"Mac";
- (void)addGoodsWithName:(NSString *)name andCount:(int)count{
    if ([name isEqualToString:iPhoneName]) {
        for (int i = 0; i < count; i++) {
            iPhone * phone = [[iPhone alloc]init];
            phone.name = @"iPhone";
            phone.price = 8388;
            [_phoneArray addObject:phone];//把手机放在手机货架上
        }
    }else if ([name isEqualToString:iPadName]){
        for (int i = 0; i < count; i++) {
            iPad * pad = [[iPad alloc]init];
            pad.name = @"iPad Pro";
            pad.price = 5188;
            [_padArray addObject:pad];//把平板放在货架上
        }
    }else if ([name isEqualToString:MacName]){
        for (int i = 0; i < count; i++) {
            Mac * mac = [[Mac alloc]init];
            mac.name = @"Mac Pro";
            mac.price = 49636;
            [_macArray addObject:mac];//把Mac放在货架上
        }
    }
}//实现往货架上边添加商品
- (NSMutableArray *)getGoodsWithName:(NSString *)name andCount:(int)count{
    NSMutableArray * shopCar = [NSMutableArray array]; //先创建一个购物车
    //再根据外界输出的名字和商品个数来判断是哪件商品
    if ([name isEqualToString:iPhoneName]) {
        for (int i = 0; i < count; i++) {
            //把手机从手机货架上放进购物车里
            [shopCar addObject:_phoneArray[0]];
            //把手机货架上拿出去的那个商品减掉
            [_phoneArray removeObject:_phoneArray[0]];
        }
    }else if ([name isEqualToString:iPadName]){
        for (int i = 0; i < count; i++) {
            //把平板从平板货架上放进购物车
            [shopCar addObject:_padArray[0]];
            //把平板货架上拿出去的那个商品减掉
            [_padArray removeObject:_padArray[0]];
        }
    }else if ([name isEqualToString:MacName]){
        for (int i = 0; i < count; i++) {
            //把Mac从Mac货架上放进购物车
            [shopCar addObject:_macArray];
            //把Mac货架上拿出去的那个商品减掉
            [_macArray removeObject:_macArray[0]];
        }
    }
    return shopCar;
}
- (void)show{
    NSLog(@"商品库存如下:iPhoneX%ld部，iPad Pro%ld部，Mac Pro%ld部",_phoneArray.count,_padArray.count,_macArray.count);
}
//给手机、平板、Mac货架初始化
- (instancetype)init
{
    //在本类的初始化方法中，对本类当中的成员变量进行初始化。
    if (self = [super init]) {
        _phoneArray = [NSMutableArray array];
        _padArray = [NSMutableArray array];
        _macArray = [NSMutableArray array];
    }
    return self;
}
@end
