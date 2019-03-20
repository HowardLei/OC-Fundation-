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
    // 1. 获取图形的上下文对象 (注意：这个是 C 语言实现的，所以下面的实现都是函数)
    CGContextRef ref = UIGraphicsGetCurrentContext();
    // 2. 为上下文对象设置路径
    // 设置起点 void CGContextMoveToPoint(CGContextRef cg_nullable c, CGFloat x, CGFloat y)
    CGContextMoveToPoint(ref, 20, 20);
    // 设置终点 void CGContextAddLineToPoint(CGContextRef cg_nullable c, CGFloat x, CGFloat y)
    CGContextAddLineToPoint(ref, 40, 40);
    // 注意：如果不再重新设置起点，则会将终点当作下次绘图的起点来进行绘制
    // 3. 绘制图形
    CGContextStrokePath(ref);
}

@end
