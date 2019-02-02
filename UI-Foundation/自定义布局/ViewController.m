//
//  ViewController.m
//  自定义布局
//
//  Created by 雷维卡 on 2019/2/2.
//

#import "ViewController.h"
#import "ITPhotoCell.h"
#define HEIGHT 300

@interface ViewController () <UICollectionViewDataSource>

@end

@implementation ViewController
static NSString *const ID = @"photo";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createACollectionView];
}
- (void)createACollectionView {
    // 1、设置布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = CGSizeMake(200, 250);
    CGRect collectionViewFrame = CGRectMake(0, 200, CGRectGetWidth(self.view.bounds), HEIGHT);
    // 2、设置 collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:collectionViewFrame collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor blackColor];
    collectionView.dataSource = self;
    collectionView.showsHorizontalScrollIndicator = NO;
    [collectionView registerClass:[ITPhotoCell class] forCellWithReuseIdentifier:ID];
    [self.view addSubview:collectionView];
}
// MARK: - Collection view data source
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ITPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    return cell;
}
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

@end
