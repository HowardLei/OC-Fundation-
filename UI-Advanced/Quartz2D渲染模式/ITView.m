//
//  ITView.m
//  Quartz2D渲染模式
//
//  Created by apple on 2019/3/24.
//

#import "ITView.h"

@implementation ITView
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self drawDemoWithUIBezithPath];
}
- (void)drawDemoWithUIBezithPath {
    [[UIColor redColor] set];
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 100, 100)];
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 100, 100) cornerRadius:100];
    [path2 appendPath:path1];
    path2.usesEvenOddFillRule = YES;
    [path2 fill];
}
- (void)drawDemoWithCGContext {
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGPoint center = CGPointMake(150, 150);
    CGFloat radius = 100;
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:center radius:radius / 2 startAngle:0 endAngle:M_PI * 2 clockwise:NO];
    CGContextAddPath(ref, path1.CGPath);
    CGContextAddPath(ref, path2.CGPath);
    // 当设置绘制图形的时候，在第二个参数上设置图形的绘制方式。
    CGContextDrawPath(ref, kCGPathFill);
}
@end
