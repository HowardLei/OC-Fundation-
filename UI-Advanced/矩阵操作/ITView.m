//
//  ITView.m
//  矩阵操作
//
//  Created by apple on 2019/4/18.
//

#import "ITView.h"

@implementation ITView

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(20, 20)];
    [path1 addLineToPoint:CGPointMake(100, 100)];
    path1.lineWidth = 10;
    [path1 stroke];
    UIBezierPath *path2 = [path1 copy];
    // 当需要进行平移、缩放、旋转操作的时候，调用 - (void)applyTransform:(CGAffineTransform)transform; 方法即可
    [path2 applyTransform:CGAffineTransformMakeTranslation(100, 0)];
    path2.lineWidth = 10;
    [[UIColor redColor] setStroke];
    [path2 stroke];
}

@end
