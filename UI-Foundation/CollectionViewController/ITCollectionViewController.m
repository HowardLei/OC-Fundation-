//
//  ITCollectionViewController.m
//  CollectionViewController
//
//  Created by 雷维卡 on 2019/1/27.
//

#import "ITCollectionViewController.h"
#define COUNT 100

@interface ITCollectionViewController () <UICollectionViewDataSource>

@end

@implementation ITCollectionViewController

static NSString *const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     获得当前 collection 的布局对象 collectionViewLayout 属性。
     注意：如果是 [UICollectionViewController new].collectionViewLayout 获得的布局。是只读属性的
          而[UICollectionViewController new].collectionView.collectionViewLayout 所获得的布局是可读可写的。
     */
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    /*
     有关 UICollectionViewFlowLayout 类的常用属性
     1、sectionHeadersPinToVisibleBounds 锁定 headerView ，使其可以在页面滚动的情况下 headerView 固定在上端
        sectionFootersPinToVisibleBounds 锁定 footerView ，使其可以在页面滚动的情况下 footerView 固定在下端
     2、scrollDirection 滚动方向:
        UICollectionViewScrollDirectionHorizontal 水平滚动
        UICollectionViewScrollDirectionVertical 垂直滚动
     3、headerReferenceSize footerReferenceSize 页眉大小、页脚大小:
        其中，当滚动方向为垂直方向的时候，仅高度设置有效。当滚动方向为水平方向的时候，仅设置宽度有效。（所有表述都是相对于 CGSizeMake函数来表示的）
     */
    layout.sectionFootersPinToVisibleBounds = YES;
    layout.headerReferenceSize = CGSizeMake(0, 100);
    layout.footerReferenceSize = CGSizeMake(1, 100);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    /*
     注意：在 UICollectionView 当中，self.view 与 self.collectionView 代表的 view 不是同一个 view
     self.view = UICollectionViewControllerWrapperView
     self.collectionView = UICollectionView
     */
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return COUNT;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    // Configure the cell
    cell.backgroundColor = [UIColor blueColor];
    return cell;
}
// 注意：在 UICollectionView 当中，没有 headerView 与 footerView 类，统一均用 UICollectionReusableView 来创建 headerView 与 footerView。通过 kind 参数来区分。
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    static NSString *const headerID = @"header";
    static NSString *const footerID = @"footer";
    UICollectionReusableView *view = nil;
    /*
     注意：是创建 headerView 还是 footerView 的依据 kind 参数决定的。
        当 kind = UICollectionElementKindSectionHeader 时，则创建 headerView
        当 kind = UICollectionElementKindSectionFooter 时，则创建 footerView
        创建的时候调用的是这个方法[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerID forIndexPath:indexPath] 不是单纯设置 ReuseID 和 indexPath 的方法。
     */
    if ([UICollectionElementKindSectionHeader isEqualToString:kind]) {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerID forIndexPath:indexPath];
        view.backgroundColor = [UIColor redColor];
    } else if ([UICollectionElementKindSectionFooter isEqualToString:kind]) {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerID forIndexPath:indexPath];
        view.backgroundColor = [UIColor greenColor];
    } else {
        @throw [NSException exceptionWithName:@"没有对应的headerView或者footerView" reason:@"查看对应的 ID 是否正确" userInfo:nil];
    }
    return view;
}

@end
