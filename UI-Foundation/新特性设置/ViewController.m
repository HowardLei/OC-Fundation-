//
//  ViewController.m
//  新特性设置
//
//  Created by 雷维卡 on 2019/2/2.
//

#import "ViewController.h"
#import "ITNewCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) NSArray<UIImage *> *images;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewLayout;
@property (weak, nonatomic) IBOutlet UICollectionView *imageCollectionView;
@end

@implementation ViewController

- (NSArray<UIImage *> *)images {
    if (_images == nil) {
        NSMutableArray<UIImage *> *arrM = [NSMutableArray array];
        for (NSInteger i = 0; i <= 7; i++) {
            NSString *imageName = [NSString stringWithFormat:@"Image%ld", i];
            UIImage *image = [UIImage imageNamed:imageName];
            [arrM addObject:image];
        }
        _images = arrM;
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionViewLayout.itemSize = self.imageCollectionView.bounds.size;
    // 其它效果全部都在设置在右边栏当中
}
// MARK: - Collection view data source
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *const ID = @"newCell";
    ITNewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.image = self.images[indexPath.row];
    cell.path = indexPath;
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}
@end
