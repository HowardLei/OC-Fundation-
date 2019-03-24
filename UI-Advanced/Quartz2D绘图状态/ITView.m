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
    [self linesWithBezithPath];
}
/**
 通过 path 管理直线
 */
- (void)linesWithBezithPath {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(20, 20)];
    [path addLineToPoint:CGPointMake(70, 70)];
    [path addLineToPoint:CGPointMake(70, 20)];
    [path closePath];
    path.lineWidth = 10;
    path.lineJoinStyle = kCGLineJoinBevel;
    path.lineCapStyle = kCGLineCapRound;
    [[UIColor redColor] setStroke];
    [path stroke];
}
/**
 通过 Quartz2D 来管理直线当中的属性
 */
- (void)linesWithCGContext {
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
