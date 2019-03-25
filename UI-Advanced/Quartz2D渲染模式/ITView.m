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
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGPoint center = CGPointMake(150, 150);
    CGFloat radius = 100;
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:center radius:radius / 2 startAngle:0 endAngle:M_PI * 2 clockwise:NO];
    UIBezierPath *path3 = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 10, 100)];
    CGContextAddPath(ref, path1.CGPath);
    CGContextAddPath(ref, path2.CGPath);
    CGContextAddPath(ref, path3.CGPath);
    CGContextDrawPath(ref, kCGPathEOFill);
}

@end
