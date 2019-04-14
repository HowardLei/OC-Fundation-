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
    NSArray<NSNumber *> *numbers = @[@300, @150.65, @55.3, @507.7, @95.8, @700, @650.65];
    UIBezierPath *path = nil;
    for (NSNumber *number in numbers) {
        path = [UIBezierPath bezierPath];
    }
}

@end
