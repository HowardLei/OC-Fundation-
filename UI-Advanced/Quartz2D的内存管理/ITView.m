//
//  ITView.m
//  Quartz2D的内存管理
//
//  Created by apple on 2019/4/18.
//

#import "ITView.h"

@implementation ITView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    // 当通过 C 语言创建对象的时候，就需要进行手动内存管理
    CGMutablePathRef pathRef = CGPathCreateMutable();
    // 当使用完这个对象的时候，需要手动调用函数释放该内存空间，否则就会出现内存泄漏。
    CFAutorelease(pathRef);
}

@end
