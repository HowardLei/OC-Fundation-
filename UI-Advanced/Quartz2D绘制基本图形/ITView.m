//
//  ITView.m
//  Quartz2D绘制基本图形
//
//  Created by apple on 2019/3/22.
//

#import "ITView.h"

@implementation ITView

- (void)drawRect:(CGRect)rect {
    [self drawCircle];
}
/**
 画长方形
 */
- (void)drawRectangle {
    // 1. 创建 UIBezierPath 路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(10, 10, 200, 200)];
    // 2. 填充路径
    [path fill];
}
/**
 画三角形
 */
- (void)drawTriangle {
    // 1. 获取当前 View 的图形上下文内容
    CGContextRef ref = UIGraphicsGetCurrentContext();
    // 2. 创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(20, 20)];
    [path addLineToPoint:CGPointMake(20, 60)];
    [path addLineToPoint:CGPointMake(60, 60)];
    [path closePath];
    CGContextAddPath(ref, path.CGPath);
    CGContextDrawPath(ref, kCGPathStroke);
}
/**
 画圆角矩形
 */
- (void)drawCornerRect {
    // 1. 创建 UIBezierPath 路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 60, 60) cornerRadius:10];
    // 2. 绘制图形
    // 注意：当需要修改绘制图形的颜色的时候，调用 UIColor 类的对象的 - (void)set; 方法
    [[UIColor greenColor] set];
    [path fill];
}
/**
 画圆形
 */
- (void)drawCircle {
    CGFloat radius = 30;
    [[UIColor redColor] set];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(40, 40, radius * 2, radius * 2) cornerRadius:radius];
    [path fill];
}
@end
