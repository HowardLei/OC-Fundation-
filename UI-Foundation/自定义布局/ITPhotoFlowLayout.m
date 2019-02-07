//
//  ITPhotoFlowLayout.m
//  自定义布局
//
//  Created by 雷维卡 on 2019/2/2.
//

#import "ITPhotoFlowLayout.h"

@interface ITPhotoFlowLayout () <UICollectionViewDelegateFlowLayout>

@end
@implementation ITPhotoFlowLayout
- (instancetype)init {
    if (self = [super init]) {
        // 注意：在这个地方没法设置 frame
    }
    return self;
}
/*
 注意：在自定义的布局类当中，由于布局的创建是优先于 CollectionView ，所以说计算布局大小的时候直接在构造方法当中是没法计算的。需要在下边的这个方法实现。注意：一旦就需要重写这个方法的时候，需要先调用其父类方法，以保证初始化的成功。
 该方法和 init 方法相似，但前者可能会被调用多次，所以一些不固定的计算（比如该计算和 collectionView 的尺寸相关），最好放在这里，以保证 collectionView 发生变化时，自定义 CollectionView 能做出正确的反应。
 */
/**
 当开始布局或者布局刷新的时候调用该方法执行准备工作
 */
- (void)prepareLayout {
    [super prepareLayout];
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    CGRect rect = self.collectionView.frame;
    CGFloat width = CGRectGetHeight(rect) * 0.6;
    CGFloat height = CGRectGetHeight(rect) * 0.8;
    self.itemSize = CGSizeMake(width, height);
}
/**
 调用该方法是控制指定 CGRect 区域所有 item 的属性。
 @param rect 单个 item 所控制的区域
 @return 所有 items 的值
 */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    // 1、取出所有 item 当中的 UICollectionViewLayoutAttributes
    NSArray<UICollectionViewLayoutAttributes *> *superAttributes = [super layoutAttributesForElementsInRect:rect];
    CGFloat screenCenter = self.collectionView.contentOffset.x + CGRectGetWidth(self.collectionView.frame) / 2;
    // 2、通过循环遍历进行访问
    for (UICollectionViewLayoutAttributes *attrs in superAttributes) {
        CGFloat deltaMargin = ABS(screenCenter - attrs.center.x);
        // 4. 计算一个放大比率 , cell 和中心点的距离和放大的比率成反比
        CGFloat scaleDelta = 1.1 - deltaMargin / (CGRectGetWidth(self.collectionView.frame) / 2 + CGRectGetWidth(attrs.frame));
        attrs.transform = CGAffineTransformMakeScale(scaleDelta, scaleDelta);
    }
    return superAttributes;
}
// MARK: 当界面开始刷新的时候，开始调用这个方法
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}
@end
