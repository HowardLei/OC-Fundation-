//
//  ITView.m
//  模拟圆下载进度条
//
//  Created by 雷维卡 on 2019/4/1.
//

#import "ITView.h"

@implementation ITView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)setProgress:(float)progress {
    _progress = progress;
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect {
    CGPoint center = CGPointMake(CGRectGetWidth(rect) / 2, CGRectGetHeight(rect) / 2);
    CGFloat radius = MIN(center.x, center.y);
    CGFloat start = -M_PI_2;
    CGFloat end = start + self.progress * 2 * M_PI;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:start endAngle:end clockwise:YES];
    [path addLineToPoint:center];
    [[UIColor redColor] set];
    [path fill];
}

@end
