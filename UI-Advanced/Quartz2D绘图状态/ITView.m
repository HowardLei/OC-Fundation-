//
//  ITView.m
//  Quartz2D绘图状态
//
//  Created by 雷维卡 on 2019/3/24.
//

#import "ITView.h"

@implementation ITView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [[UIColor redColor] set];
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ref, 20, 20);
    CGContextAddLineToPoint(ref, 100, 100);
    // 设置线宽
    CGContextSetLineWidth(ref, 10);
    // 设置线头
    CGContextSetLineCap(ref, kCGLineCapRound);
    // 设置线与线之间的连接处的样式
    CGContextSetLineJoin(ref, kCGLineJoinRound);
    CGContextDrawPath(ref, kCGPathStroke);
}

@end
