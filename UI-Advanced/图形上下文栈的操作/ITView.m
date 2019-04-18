//
//  ITView.m
//  图形上下文栈的操作
//
//  Created by apple on 2019/4/18.
//

#import "ITView.h"

@implementation ITView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef ref = UIGraphicsGetCurrentContext();
    // 当需要保存当前图形上下文的状态，调用函数 void CGContextSaveGState(CGContextRef cg_nullable c);
    CGContextSaveGState(ref);
    CGContextMoveToPoint(ref, 20, 20);
    CGContextAddLineToPoint(ref, 100, 20);
    CGContextSetLineWidth(ref, 10);
    [[UIColor redColor] set];
    CGContextDrawPath(ref, kCGPathStroke);
    // 当需要恢复图形上下文状态，调用函数 void CGContextRestoreGState(CGContextRef cg_nullable c);
    CGContextRestoreGState(ref);
    CGContextAddRect(ref, CGRectMake(0, 0, 20, 20));
    CGContextDrawPath(ref, kCGPathStroke);
}

@end
