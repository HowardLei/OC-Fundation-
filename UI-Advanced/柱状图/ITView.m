//
//  ITView.m
//  柱状图
//
//  Created by apple on 2019/3/27.
//

#import "ITView.h"

@implementation ITView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [[UIColor redColor] set];
    NSArray<NSNumber *> *numbers = @[@300, @150.65, @55.3, @507.7, @95.8, @700, @650.65];
    NSUInteger count = numbers.count;
    UIBezierPath *path = nil;
    CGFloat margin = 10;
    CGFloat width = (CGRectGetWidth(rect) - (count - 1) * margin) / count;
    CGFloat height = 0;
    for (NSUInteger i = 0; i < count; i++) {
        height = numbers[i].floatValue * 0.3;
        path = [UIBezierPath bezierPathWithRect:CGRectMake(width * i + margin * (i - 1), 300 - height, width, height)];
        [path fill];
    }
}
@end
