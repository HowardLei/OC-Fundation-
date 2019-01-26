//
//  ViewController.m
//  通过代码（Collectio）实现应用管理
//
//  Created by 雷维卡 on 2019/1/26.
//

#import "ViewController.h"
#import "ITCollectionViewCell.h"
#import "ITApp.h"
// 设置 cell 的重用 ID
#define ID @"collectionViewCell"
@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) NSArray<ITApp *> *modelArr;
@end

@implementation ViewController
// MARK: Lazy loading model
- (NSArray<ITApp *> *)modelArr {
    if (_modelArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"app" ofType:@".plist"];
        NSArray *tempArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray<ITApp *> *arrM = [NSMutableArray array];
        for (NSDictionary *dict in tempArr) {
            ITApp *appModel = [ITApp appWithDict:dict];
            [arrM addObject:appModel];
        }
        _modelArr = arrM;
    }
    return _modelArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createACollectionView];
}

- (void)createACollectionView {
    CGFloat cellLength = 100;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(cellLength, cellLength);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerClass:[ITCollectionViewCell class] forCellWithReuseIdentifier:ID];
    [self.view addSubview:collectionView];
}
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    // 注意：如果需要自定义 Collection view cell 当中的内容，则需要在自定义 cell 当中重写 initWithFrame 方法
    ITCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    ITApp *model = self.modelArr[indexPath.row];
    cell.model = model;
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.modelArr.count;
}
@end
