//
//  ITView.m
//  Quartz2D绘制基本图形
//
//  Created by apple on 2019/3/22.
//

#import "ITView.h"

@implementation ITView

- (void)drawRect:(CGRect)rect {
    CGPoint circleCenter = CGPointMake(50, 50);
    [self drawArcWithCenter:circleCenter radius:50 startAngle:0 endAngle:M_PI_2 clockwise:YES];
}
/**
 画长方形
 @param rect 设置的长方形
 */
- (void)drawRectangle:(CGRect)rect {
    // OC 方式
    // 1. 创建 UIBezierPath 路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
    // 2. 填充路径
    [path fill];
    // C 方式
    // 1. 获得当前 view 的上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    // 2. 添加矩形
    CGContextAddRect(ref, rect);
    // 3. 绘制图形
    CGContextDrawPath(ref, kCGPathFill);
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
    // OC 部分
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
    // OC 方式
    CGFloat radius = 60;
    //    [[UIColor redColor] set];
    //    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(40, 40, radius * 2, radius * 2) cornerRadius:radius];
    //    [path fill];
    // C 方式
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ref, CGRectMake(40, 40, radius, radius));
    CGContextDrawPath(ref, kCGPathFill);
}
/**
 画椭圆
 */
- (void)drawEcilpse {
    // OC 方式
    // UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, 200, 100)];
    // [path stroke];
    // C 方式
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ref, CGRectMake(20, 20, 200, 150));
    CGContextDrawPath(ref, kCGPathStroke);
}
/**
 画圆弧
 @param point 圆弧的圆心
 @param radius 圆弧的半径
 @param angle1 起始弧度
 @param angle2 终点弧度
 @param clockwise 是否顺时针
 */
- (void)drawArcWithCenter:(CGPoint)point radius:(CGFloat)radius startAngle:(CGFloat)angle1 endAngle:(CGFloat)angle2 clockwise:(BOOL)clockwise {
    // OC 方式
    //    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:point radius:radius startAngle:angle1 endAngle:angle2 clockwise:clockwise];
    //    [path stroke];
    // C 方式
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextAddArc(ref, point.x, point.y, radius, angle1, angle2, !clockwise);
    CGContextDrawPath(ref, kCGPathStroke);
}
/**
 关于曲线的小 demo
 */
- (void)demo {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [[UIColor greenColor] set];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addCurveToPoint:CGPointMake(60, 60) controlPoint1:CGPointMake(30, 200) controlPoint2:CGPointMake(40, 50)];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(30, 200)];
    [path addLineToPoint:CGPointMake(40, 50)];
    [path addLineToPoint:CGPointMake(60, 60)];
    [path addQuadCurveToPoint:CGPointMake(0, 0) controlPoint:CGPointMake(42, 43)];
    [path stroke];
}
@end
