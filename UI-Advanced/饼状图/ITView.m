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
    /*
     绘制饼状图算法总结
     1. 获得饼状图各个部分的数据
     2. 设置圆心、半径
     3. 创建起点、终点、路径变量
     4. 通过 for 循环，不断计算出起点与终点坐标，路径为弧线。设置给创建好的 UIBezierPath 对象
     */
    for (NSNumber *number in numbers) {
        [[UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1] setFill];
        end = start + (number.doubleValue / 100) * 2 * M_PI;
        path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:start endAngle:end clockwise:YES];
        // 注意：绘制的时候，千万不要忘了将弧线的终点与圆心之间相连接。否则绘制的图形是扇形。
        [path addLineToPoint:center];
        start = end;
        [path fill];
    }
}
@end
