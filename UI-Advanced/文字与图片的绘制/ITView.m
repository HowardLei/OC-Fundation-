//
//  ITView.m
//  文字与图片的绘制
//
//  Created by apple on 2019/4/18.
//

#import "ITView.h"

@implementation ITView
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
/**
 绘制字符串
 */
- (void)drawString {
    NSString *str = @"123";
    NSDictionary<NSAttributedStringKey, id> *attrDict = @{NSFontAttributeName: [UIFont systemFontOfSize:40], NSForegroundColorAttributeName: [UIColor greenColor], NSUnderlineStyleAttributeName: @1};
//    [str drawInRect:CGRectMake(50, 50, 200, 200) withAttributes:attrDict];
    [str drawAtPoint:CGPointZero withAttributes:attrDict];
}
/**
 绘制图片
 */
- (void)drawImageWithRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"Image"];
    [image drawInRect:rect blendMode:kCGBlendModeNormal alpha:1];
    [image drawAtPoint:CGPointZero blendMode:kCGBlendModeNormal alpha:1];
}
@end
