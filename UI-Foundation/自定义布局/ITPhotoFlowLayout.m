//
//  ITPhotoFlowLayout.m
//  自定义布局
//
//  Created by 雷维卡 on 2019/2/2.
//

#import "ITPhotoFlowLayout.h"

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
 当布局进行刷新的时候，就会调用此方法
 */
- (void)prepareLayout {
    [super prepareLayout];
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    CGRect rect = self.collectionView.frame;
    CGFloat width = CGRectGetHeight(rect) * 0.6;
    CGFloat height = CGRectGetHeight(rect) * 0.8;
    self.itemSize = CGSizeMake(width, height);
}
// 这个方法是设置所有 cell 里面的属性
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    // 1、取出所有 item 当中的 UICollectionViewLayoutAttributes
    NSArray<UICollectionViewLayoutAttributes *> *superAttributes = [super layoutAttributesForElementsInRect:rect];
    // 2、通过循环遍历进行访问
    for (UICollectionViewLayoutAttributes *attrs in superAttributes) {
        NSLog(@"%@", NSStringFromCGRect(attrs.frame));
    }
    return superAttributes;
}
// MARK: 当
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}
@end
