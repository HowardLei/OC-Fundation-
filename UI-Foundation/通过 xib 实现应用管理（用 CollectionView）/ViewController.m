//
//  ViewController.m
//  通过 xib 实现应用管理（用 CollectionView）
//
//  Created by 雷维卡 on 2019/1/27.
//

#import "ViewController.h"
#import "ITCollectionViewCell.h"
#define SIZEHEIGHT 100
#define ID @"cellID"

@interface ViewController () <UICollectionViewDataSource>
@property (nonatomic, strong) NSArray<ITModel *> *modelArr;
@end

@implementation ViewController
- (NSArray<ITModel *> *)modelArr {
    if (_modelArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"app" ofType:@".plist"];
        NSArray *tempArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray<ITModel *> *arrM = [NSMutableArray array];
        for (NSDictionary *dict in tempArr) {
            ITModel *appModel = [ITModel modelWithDict:dict];
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
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(SIZEHEIGHT, SIZEHEIGHT);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    UINib *nib = [UINib nibWithNibName:@"ITCollectionViewCell" bundle:nil];
    [collectionView registerNib:nib forCellWithReuseIdentifier:ID];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
}
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ITCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    cell.model = self.modelArr[indexPath.row];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.modelArr.count;
}
@end
