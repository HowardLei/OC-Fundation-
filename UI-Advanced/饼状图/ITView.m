//
//  ITView.m
//  饼状图
//
//  Created by apple on 2019/3/25.
//

#import "ITView.h"

@implementation ITView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    // 将每部分大小保存在数组当中
    NSArray<NSNumber *> *numbers = @[@30, @15, @5, @17, @3, @10, @20];
    CGPoint center = CGPointMake(CGRectGetWidth(self.bounds) / 2, CGRectGetHeight(self.bounds) / 2);
    CGFloat radius = MIN(center.x, center.y);
    CGFloat start = 0;
    CGFloat end = 0;
    UIBezierPath *path = nil;
    for (NSNumber *number in numbers) {
        [[UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1] setFill];
        end = start + (number.doubleValue / 100) * 2 * M_PI;
        path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:start endAngle:end clockwise:YES];
        [path addLineToPoint:center];
        start = end;
        [path fill];
    }
}
@end
