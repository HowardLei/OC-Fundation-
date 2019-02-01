//
//  ViewController.m
//  新特性设置
//
//  Created by 雷维卡 on 2019/2/2.
//

#import "ViewController.h"
#import "ITNewCell.h"

@interface ViewController () <UICollectionViewDataSource>
@property (nonatomic, strong) NSArray<UIImage *> *images;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionViewLayout;
@property (weak, nonatomic) IBOutlet UICollectionView *imageCollectionView;
@end

@implementation ViewController
static NSString *const ID = @"newCell";
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
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ITNewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    cell.image = self.images[indexPath.row];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

@end
