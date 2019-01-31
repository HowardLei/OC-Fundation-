//
//  ITCollectionViewController.m
//  英雄展示
//
//  Created by 雷维卡 on 2019/1/30.
//

#import "ITCollectionViewController.h"
#import "ITHero.h"
#import "ITHeroCell.h"
@interface ITCollectionViewController ()
@property (nonatomic, strong) NSArray<ITHero *> *modelArr;
@end

@implementation ITCollectionViewController
#pragma mark Lazy loading data
static NSString *const reuseIdentifier = @"Cell";

- (NSArray<ITHero *> *)modelArr {
    if (_modelArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heroes" ofType:@".plist"];
        NSArray *tempArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray<ITHero *> *arrM = [NSMutableArray array];
        for (NSDictionary *dict in tempArr) {
            ITHero *appModel = [ITHero heroWithDict:dict];
            [arrM addObject:appModel];
        }
        _modelArr = arrM;
    }
    return _modelArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.modelArr.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ITHeroCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.model = self.modelArr[indexPath.row];
    // Configure the cell
    return cell;
}

@end
