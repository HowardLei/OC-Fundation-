//
//  ITView.m
//  Quartz2D简易绘图
//
//  Created by 雷维卡 on 2019/3/21.
//

#import "ITView.h"

@implementation ITView
/*
 当我们需要自定义 View 的时候，需要重写这个方法
 */
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self demo3];
}
/**
 通过 C 语言来进行绘图
 */
- (void)demo1 {
    // 1. 获取图形的上下文对象 (注意：这个是 C 语言实现的，所以下面的实现都是函数)
    CGContextRef ref = UIGraphicsGetCurrentContext();
    // 2. 为上下文对象设置路径
    // 设置起点 void CGContextMoveToPoint(CGContextRef cg_nullable c, CGFloat x, CGFloat y)
    CGContextMoveToPoint(ref, 20, 20);
    // 设置终点 void CGContextAddLineToPoint(CGContextRef cg_nullable c, CGFloat x, CGFloat y)
    CGContextAddLineToPoint(ref, 40, 40);
    // 注意：如果不再重新设置起点，则会将终点当作下次绘图的起点来进行绘制。如果需要重新定点的话，需要重新设置起点
    CGContextAddLineToPoint(ref, 40, 20);
    // 当你的封闭图形还差一根线完成的时候，调用这个函数。就可以直接完成图案的填充。
    CGContextClosePath(ref);
    // 3. 绘制图形
    CGContextStrokePath(ref);
}
/**
 通过 UIBezierPath 来绘制图像
 */
- (void)demo2 {
    // 1. 创建一个 UIBezierPath 对象
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, 50, 50)];
    // 2. 渲染图形
    [path fill];
}
/**
 用 C 和 OC 混合绘图
 */
- (void)demo3 {
    // 1. 获取绘制上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    // 2. 创建一个 UIBezierPath 对象
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, 60, 60)];
    CGContextAddPath(ref, path.CGPath);
    CGContextDrawPath(ref, kCGPathStroke);
}
@end
